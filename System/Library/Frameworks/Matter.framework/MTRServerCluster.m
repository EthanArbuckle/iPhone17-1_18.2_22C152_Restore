@interface MTRServerCluster
+ (id)newDescriptorCluster;
- (BOOL)addAttribute:(id)a3;
- (BOOL)addToEndpoint:(unsigned __int16)a3;
- (BOOL)associateWithController:(id)a3;
- (MTRServerCluster)initWithClusterID:(id)a3 revision:(id)a4;
- (NSArray)acceptedCommands;
- (NSArray)accessGrants;
- (NSArray)attributes;
- (NSArray)generatedCommands;
- (NSArray)matterAccessGrants;
- (NSNumber)clusterID;
- (NSNumber)clusterRevision;
- (Span<const)matterAttributeMetadata;
- (id).cxx_construct;
- (id)description;
- (unsigned)matterAcceptedCommands;
- (unsigned)matterGeneratedCommands;
- (unsigned)parentEndpoint;
- (void)addAccessGrant:(id)a3;
- (void)invalidate;
- (void)registerMatterCluster;
- (void)removeAccessGrant:(id)a3;
- (void)setAcceptedCommands:(id)a3;
- (void)setGeneratedCommands:(id)a3;
- (void)unregisterMatterCluster;
@end

@implementation MTRServerCluster

- (MTRServerCluster)initWithClusterID:(id)a3 revision:(id)a4
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  unint64_t v10 = objc_msgSend_unsignedLongLongValue(v6, v8, v9);
  unint64_t v13 = v10;
  if (HIDWORD(v10))
  {
    v15 = sub_244CC8484(0, "NotSpecified");
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134217984;
      uint64_t v25 = v13;
      _os_log_impl(&dword_2446BD000, v15, OS_LOG_TYPE_ERROR, "MTRServerCluster provided too-large cluster ID: 0x%llx", buf, 0xCu);
    }

    if (!sub_244CC4E58(1u)) {
      goto LABEL_20;
    }
    goto LABEL_19;
  }
  if (WORD1(v10) > 0xFFF4u
    || ((__int16)v10 < 0 || WORD1(v10)) && (!WORD1(v10) || (unsigned __int16)(v10 + 1024) >= 0x3FFu))
  {
    v16 = sub_244CC8484(0, "NotSpecified");
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v25) = v13;
      _os_log_impl(&dword_2446BD000, v16, OS_LOG_TYPE_ERROR, "MTRServerCluster provided invalid cluster ID: 0x%x", buf, 8u);
    }

    if (!sub_244CC4E58(1u)) {
      goto LABEL_20;
    }
    goto LABEL_19;
  }
  if (v10 == 29)
  {
    v14 = sub_244CC8484(0, "NotSpecified");
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2446BD000, v14, OS_LOG_TYPE_ERROR, "Should be using newDescriptorCluster to initialize an MTRServerCluster for Descriptor", buf, 2u);
    }

    if (!sub_244CC4E58(1u)) {
      goto LABEL_20;
    }
    goto LABEL_19;
  }
  uint64_t v21 = objc_msgSend_unsignedLongLongValue(v7, v11, v12);
  if ((unint64_t)(v21 - 0x10000) > 0xFFFFFFFFFFFF0000)
  {
    v23 = objc_msgSend_set(MEMORY[0x263EFFA08], v19, v20);
    self = (MTRServerCluster *)sub_2446CDA04(self, v6, v7, v23, MEMORY[0x263EFFA68]);

    v17 = self;
    goto LABEL_21;
  }
  v22 = sub_244CC8484(0, "NotSpecified");
  if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 134217984;
    uint64_t v25 = v21;
    _os_log_impl(&dword_2446BD000, v22, OS_LOG_TYPE_ERROR, "MTRServerCluster provided invalid cluster revision: 0x%llx", buf, 0xCu);
  }

  if (sub_244CC4E58(1u)) {
LABEL_19:
  }
    sub_244CC4DE0(0, 1);
LABEL_20:
  v17 = 0;
LABEL_21:

  return v17;
}

+ (id)newDescriptorCluster
{
  v2 = [MTRServerCluster alloc];
  v5 = objc_msgSend_set(MEMORY[0x263EFFA08], v3, v4);
  id v6 = sub_2446CDA04(v2, &unk_26F9C8440, &unk_26F9C8458, v5, MEMORY[0x263EFFA68]);

  return v6;
}

- (void)addAccessGrant:(id)a3
{
  id v5 = a3;
  os_unfair_lock_lock(&self->_lock);
  objc_msgSend_addObject_(self->_accessGrants, v4, (uint64_t)v5);
  sub_2446CDD64((uint64_t)self);
  os_unfair_lock_unlock(&self->_lock);
}

- (void)removeAccessGrant:(id)a3
{
  id v5 = a3;
  os_unfair_lock_lock(&self->_lock);
  objc_msgSend_removeObject_(self->_accessGrants, v4, (uint64_t)v5);
  sub_2446CDD64((uint64_t)self);
  os_unfair_lock_unlock(&self->_lock);
}

- (NSArray)matterAccessGrants
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  id v6 = objc_msgSend_allObjects(self->_matterAccessGrants, v4, v5);
  os_unfair_lock_unlock(p_lock);

  return (NSArray *)v6;
}

- (BOOL)addAttribute:(id)a3
{
  uint64_t v61 = *MEMORY[0x263EF8340];
  id v4 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_deviceController);
  if (!WeakRetained)
  {
    v16 = objc_msgSend_attributeID(v4, v6, v7);
    unint64_t v19 = objc_msgSend_unsignedLongLongValue(v16, v17, v18);

    if (v19 - 65528 <= 5 && ((1 << (v19 + 8)) & 0x2B) != 0)
    {
      uint64_t v21 = sub_244CC8484(0, "NotSpecified");
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        uint64_t v24 = objc_msgSend_unsignedLongLongValue(self->_clusterID, v22, v23);
        *(_DWORD *)buf = 134218240;
        unint64_t v58 = v19;
        __int16 v59 = 2048;
        uint64_t v60 = v24;
        _os_log_impl(&dword_2446BD000, v21, OS_LOG_TYPE_ERROR, "Cannot add global attribute %llx on cluster %llx", buf, 0x16u);
      }

      if (sub_244CC4E58(1u)) {
        goto LABEL_5;
      }
    }
    else
    {
      int isEqual = objc_msgSend_isEqual_(self->_clusterID, v20, (uint64_t)&unk_26F9C8440);
      if (v19 < 4) {
        int v26 = isEqual;
      }
      else {
        int v26 = 0;
      }
      if (v26 == 1)
      {
        v27 = sub_244CC8484(0, "NotSpecified");
        if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 134217984;
          unint64_t v58 = v19;
          _os_log_impl(&dword_2446BD000, v27, OS_LOG_TYPE_ERROR, "Cannot add attribute with id %llx on descriptor cluster", buf, 0xCu);
        }

        if (sub_244CC4E58(1u))
        {
          sub_244CC4DE0(0, 1);
          BOOL v15 = 0;
          goto LABEL_36;
        }
      }
      else
      {
        long long v54 = 0u;
        long long v55 = 0u;
        long long v52 = 0u;
        long long v53 = 0u;
        obj = self->_attributes;
        uint64_t v31 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v28, (uint64_t)&v52, v56, 16);
        if (v31)
        {
          uint64_t v32 = *(void *)v53;
          while (2)
          {
            for (uint64_t i = 0; i != v31; ++i)
            {
              if (*(void *)v53 != v32) {
                objc_enumerationMutation(obj);
              }
              v34 = objc_msgSend_attributeID(*(void **)(*((void *)&v52 + 1) + 8 * i), v29, v30);
              BOOL v37 = objc_msgSend_unsignedLongLongValue(v34, v35, v36) == v19;

              if (v37)
              {
                v44 = sub_244CC8484(0, "NotSpecified");
                if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
                {
                  uint64_t v47 = objc_msgSend_unsignedLongLongValue(self->_clusterID, v45, v46);
                  *(_DWORD *)buf = 134218240;
                  unint64_t v58 = v19;
                  __int16 v59 = 2048;
                  uint64_t v60 = v47;
                  _os_log_impl(&dword_2446BD000, v44, OS_LOG_TYPE_ERROR, "Cannot add second attribute with ID %llx on cluster %llx", buf, 0x16u);
                }

                if (sub_244CC4E58(1u))
                {
                  objc_msgSend_unsignedLongLongValue(self->_clusterID, v48, v49);
                  sub_244CC4DE0(0, 1);
                }

                goto LABEL_35;
              }
            }
            uint64_t v31 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v29, (uint64_t)&v52, v56, 16);
            if (v31) {
              continue;
            }
            break;
          }
        }

        unsigned __int16 parentEndpoint = self->_parentEndpoint;
        int v41 = objc_msgSend_unsignedLongLongValue(self->_clusterID, v39, v40);
        *(_WORD *)buf = parentEndpoint;
        LODWORD(v58) = v41;
        if (objc_msgSend_addToCluster_(v4, v42, (uint64_t)buf))
        {
          objc_msgSend_addObject_(self->_attributes, v43, (uint64_t)v4);
          BOOL v15 = 1;
          goto LABEL_36;
        }
      }
    }
LABEL_35:
    BOOL v15 = 0;
    goto LABEL_36;
  }
  uint64_t v9 = sub_244CC8484(0, "NotSpecified");
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    uint64_t v12 = objc_msgSend_unsignedLongLongValue(self->_clusterID, v10, v11);
    *(_DWORD *)buf = 134217984;
    unint64_t v58 = v12;
    _os_log_impl(&dword_2446BD000, v9, OS_LOG_TYPE_ERROR, "Cannot add attribute on cluster %llx which is already in use", buf, 0xCu);
  }

  if (!sub_244CC4E58(1u)) {
    goto LABEL_35;
  }
LABEL_5:
  objc_msgSend_unsignedLongLongValue(self->_clusterID, v13, v14);
  sub_244CC4DE0(0, 1);
  BOOL v15 = 0;
LABEL_36:

  os_unfair_lock_unlock(p_lock);
  return v15;
}

- (BOOL)associateWithController:(id)a3
{
  uint64_t v127 = *MEMORY[0x263EF8340];
  id v4 = a3;
  os_unfair_lock_t lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_deviceController);
  if (WeakRetained)
  {
    uint64_t v5 = sub_244CC8484(0, "NotSpecified");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v8 = objc_msgSend_uniqueIdentifier(v4, v6, v7);
      uint64_t v11 = objc_msgSend_uniqueIdentifier(WeakRetained, v9, v10);
      buf[0] = 138412546;
      *(void *)&buf[1] = v8;
      __int16 v123 = 2112;
      *(void *)v124 = v11;
      _os_log_impl(&dword_2446BD000, v5, OS_LOG_TYPE_ERROR, "Cannot associate MTRServerCluster with controller %@; already associated with controller %@",
        (uint8_t *)buf,
        0x16u);
    }
    if (sub_244CC4E58(1u))
    {
      objc_msgSend_uniqueIdentifier(v4, v12, v13);
      uint64_t v14 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
      v108 = objc_msgSend_uniqueIdentifier(WeakRetained, v15, v16);
      sub_244CC4DE0(0, 1);

LABEL_6:
    }
  }
  else
  {
    long long v120 = 0u;
    long long v121 = 0u;
    long long v118 = 0u;
    long long v119 = 0u;
    uint64_t v14 = self->_attributes;
    uint64_t v19 = objc_msgSend_countByEnumeratingWithState_objects_count_(v14, v17, (uint64_t)&v118, v126, 16);
    if (v19)
    {
      uint64_t v20 = *(void *)v119;
LABEL_9:
      uint64_t v21 = 0;
      while (1)
      {
        if (*(void *)v119 != v20) {
          objc_enumerationMutation(v14);
        }
        if ((objc_msgSend_associateWithController_(*(void **)(*((void *)&v118 + 1) + 8 * v21), v18, (uint64_t)v4) & 1) == 0) {
          goto LABEL_6;
        }
        if (v19 == ++v21)
        {
          uint64_t v19 = objc_msgSend_countByEnumeratingWithState_objects_count_(v14, v18, (uint64_t)&v118, v126, 16);
          if (v19) {
            goto LABEL_9;
          }
          break;
        }
      }
    }

    uint64_t v24 = (NSSet *)objc_msgSend_copy(self->_accessGrants, v22, v23);
    matterAccessGrants = self->_matterAccessGrants;
    self->_matterAccessGrants = v24;

    uint64_t v28 = objc_msgSend_count(self->_attributes, v26, v27);
    long long v116 = 0u;
    long long v117 = 0u;
    long long v114 = 0u;
    long long v115 = 0u;
    v29 = self->_attributes;
    uint64_t v33 = objc_msgSend_countByEnumeratingWithState_objects_count_(v29, v30, (uint64_t)&v114, v125, 16);
    if (v33)
    {
      uint64_t v34 = *(void *)v115;
      while (2)
      {
        for (uint64_t i = 0; i != v33; ++i)
        {
          if (*(void *)v115 != v34) {
            objc_enumerationMutation(v29);
          }
          uint64_t v36 = objc_msgSend_attributeID(*(void **)(*((void *)&v114 + 1) + 8 * i), v31, v32);
          char isEqual = objc_msgSend_isEqual_(v36, v37, (uint64_t)&unk_26F9C8470);

          if (isEqual)
          {
            unsigned int v111 = 0;
            goto LABEL_25;
          }
        }
        uint64_t v33 = objc_msgSend_countByEnumeratingWithState_objects_count_(v29, v31, (uint64_t)&v114, v125, 16);
        if (v33) {
          continue;
        }
        break;
      }
    }
    unsigned int v111 = 1;
LABEL_25:

    int v40 = objc_msgSend_isEqual_(self->_clusterID, v39, (uint64_t)&unk_26F9C8440);
    uint64_t v43 = v28 + v111;
    if (v40) {
      v43 += 4;
    }
    uint64_t v110 = v43 + 1;
    if ((unint64_t)(v43 + 1) <= 0xFFFE)
    {
      int v109 = v40;
      unint64_t v44 = 0;
      p_matterAttributeMetadata = &self->_matterAttributeMetadata;
      p_end_cap = &self->_matterAttributeMetadata.__end_cap_;
      while (v44 < objc_msgSend_count(self->_attributes, v41, v42))
      {
        uint64_t v49 = objc_msgSend_objectAtIndexedSubscript_(self->_attributes, (const char *)v47, v44);
        long long v52 = objc_msgSend_attributeID(v49, v50, v51);
        int v55 = objc_msgSend_unsignedLongLongValue(v52, v53, v54);
        int v56 = v55;
        end = self->_matterAttributeMetadata.__end_;
        value = self->_matterAttributeMetadata.__end_cap_.__value_;
        if (end >= value)
        {
          uint64_t v60 = (end - p_matterAttributeMetadata->__begin_) >> 4;
          unint64_t v61 = v60 + 1;
          if ((unint64_t)(v60 + 1) >> 60) {
            sub_2446D033C();
          }
          uint64_t v62 = value - p_matterAttributeMetadata->__begin_;
          if (v62 >> 3 > v61) {
            unint64_t v61 = v62 >> 3;
          }
          if ((unint64_t)v62 >= 0x7FFFFFFFFFFFFFF0) {
            unint64_t v63 = 0xFFFFFFFFFFFFFFFLL;
          }
          else {
            unint64_t v63 = v61;
          }
          if (v63) {
            v64 = (char *)sub_2446D03E4((uint64_t)&self->_matterAttributeMetadata.__end_cap_, v63);
          }
          else {
            v64 = 0;
          }
          v65 = &v64[16 * v60];
          *(_DWORD *)v65 = 0;
          *((_DWORD *)v65 + 2) = v56;
          *((_DWORD *)v65 + 3) = 273154048;
          begin = self->_matterAttributeMetadata.__begin_;
          v66 = self->_matterAttributeMetadata.__end_;
          v68 = (EmberAfAttributeMetadata *)v65;
          if (v66 != begin)
          {
            do
            {
              *((_OWORD *)v68 - 1) = *((_OWORD *)v66 - 1);
              v68 = (EmberAfAttributeMetadata *)((char *)v68 - 16);
              v66 = (EmberAfAttributeMetadata *)((char *)v66 - 16);
            }
            while (v66 != begin);
            v66 = p_matterAttributeMetadata->__begin_;
          }
          __int16 v59 = (EmberAfAttributeMetadata *)(v65 + 16);
          self->_matterAttributeMetadata.__begin_ = v68;
          self->_matterAttributeMetadata.__end_ = (EmberAfAttributeMetadata *)(v65 + 16);
          self->_matterAttributeMetadata.__end_cap_.__value_ = (EmberAfAttributeMetadata *)&v64[16 * v63];
          if (v66) {
            operator delete(v66);
          }
        }
        else
        {
          *(_DWORD *)end = 0;
          __int16 v59 = (EmberAfAttributeMetadata *)((char *)end + 16);
          *((_DWORD *)end + 2) = v55;
          *((_DWORD *)end + 3) = 273154048;
        }
        self->_matterAttributeMetadata.__end_ = v59;

        ++v44;
      }
      v81 = self->_matterAttributeMetadata.__end_;
      if (v111)
      {
        if (v81 >= p_end_cap->__value_)
        {
          uint64_t v82 = (v81 - p_matterAttributeMetadata->__begin_) >> 4;
          if ((unint64_t)(v82 + 1) >> 60) {
            sub_2446D033C();
          }
          uint64_t v83 = p_end_cap->__value_ - p_matterAttributeMetadata->__begin_;
          uint64_t v84 = v83 >> 3;
          if (v83 >> 3 <= (unint64_t)(v82 + 1)) {
            uint64_t v84 = v82 + 1;
          }
          if ((unint64_t)v83 >= 0x7FFFFFFFFFFFFFF0) {
            unint64_t v47 = 0xFFFFFFFFFFFFFFFLL;
          }
          else {
            unint64_t v47 = v84;
          }
          if (v47) {
            v85 = (char *)sub_2446D03E4((uint64_t)&self->_matterAttributeMetadata.__end_cap_, v47);
          }
          else {
            v85 = 0;
          }
          v86 = &v85[16 * v82];
          v87 = (EmberAfAttributeMetadata *)&v85[16 * v47];
          *(_DWORD *)v86 = 0;
          *((void *)v86 + 1) = 0x101B00040000FFFCLL;
          v81 = (EmberAfAttributeMetadata *)(v86 + 16);
          v89 = self->_matterAttributeMetadata.__begin_;
          v88 = self->_matterAttributeMetadata.__end_;
          if (v88 != v89)
          {
            do
            {
              *((_OWORD *)v86 - 1) = *((_OWORD *)v88 - 1);
              v86 -= 16;
              v88 = (EmberAfAttributeMetadata *)((char *)v88 - 16);
            }
            while (v88 != v89);
            v88 = p_matterAttributeMetadata->__begin_;
          }
          self->_matterAttributeMetadata.__begin_ = (EmberAfAttributeMetadata *)v86;
          self->_matterAttributeMetadata.__end_ = v81;
          self->_matterAttributeMetadata.__end_cap_.__value_ = v87;
          if (v88) {
            operator delete(v88);
          }
        }
        else
        {
          *(_DWORD *)v81 = 0;
          *((void *)v81 + 1) = 0x101B00040000FFFCLL;
          v81 = (EmberAfAttributeMetadata *)((char *)v81 + 16);
        }
        self->_matterAttributeMetadata.__end_ = v81;
      }
      if (v109)
      {
        v90 = (uint64_t *)&xmmword_244E79CF0;
        do
        {
          if (v81 >= p_end_cap->__value_)
          {
            uint64_t v91 = (v81 - p_matterAttributeMetadata->__begin_) >> 4;
            if ((unint64_t)(v91 + 1) >> 60) {
              sub_2446D033C();
            }
            uint64_t v92 = p_end_cap->__value_ - p_matterAttributeMetadata->__begin_;
            uint64_t v93 = v92 >> 3;
            if (v92 >> 3 <= (unint64_t)(v91 + 1)) {
              uint64_t v93 = v91 + 1;
            }
            if ((unint64_t)v92 >= 0x7FFFFFFFFFFFFFF0) {
              unint64_t v47 = 0xFFFFFFFFFFFFFFFLL;
            }
            else {
              unint64_t v47 = v93;
            }
            if (v47) {
              v94 = (char *)sub_2446D03E4((uint64_t)&self->_matterAttributeMetadata.__end_cap_, v47);
            }
            else {
              v94 = 0;
            }
            v95 = &v94[16 * v91];
            *(_OWORD *)v95 = *(_OWORD *)v90;
            v97 = self->_matterAttributeMetadata.__begin_;
            v96 = self->_matterAttributeMetadata.__end_;
            v98 = (EmberAfAttributeMetadata *)v95;
            if (v96 != v97)
            {
              do
              {
                *((_OWORD *)v98 - 1) = *((_OWORD *)v96 - 1);
                v98 = (EmberAfAttributeMetadata *)((char *)v98 - 16);
                v96 = (EmberAfAttributeMetadata *)((char *)v96 - 16);
              }
              while (v96 != v97);
              v96 = p_matterAttributeMetadata->__begin_;
            }
            v81 = (EmberAfAttributeMetadata *)(v95 + 16);
            self->_matterAttributeMetadata.__begin_ = v98;
            self->_matterAttributeMetadata.__end_ = (EmberAfAttributeMetadata *)(v95 + 16);
            self->_matterAttributeMetadata.__end_cap_.__value_ = (EmberAfAttributeMetadata *)&v94[16 * v47];
            if (v96) {
              operator delete(v96);
            }
          }
          else
          {
            *(_OWORD *)v81 = *(_OWORD *)v90;
            v81 = (EmberAfAttributeMetadata *)((char *)v81 + 16);
          }
          self->_matterAttributeMetadata.__end_ = v81;
          v90 += 2;
        }
        while (v90 != &qword_244E79D30);
      }
      if (v81 >= p_end_cap->__value_)
      {
        uint64_t v100 = (v81 - p_matterAttributeMetadata->__begin_) >> 4;
        if ((unint64_t)(v100 + 1) >> 60) {
          sub_2446D033C();
        }
        uint64_t v101 = p_end_cap->__value_ - p_matterAttributeMetadata->__begin_;
        uint64_t v102 = v101 >> 3;
        if (v101 >> 3 <= (unint64_t)(v100 + 1)) {
          uint64_t v102 = v100 + 1;
        }
        if ((unint64_t)v101 >= 0x7FFFFFFFFFFFFFF0) {
          unint64_t v47 = 0xFFFFFFFFFFFFFFFLL;
        }
        else {
          unint64_t v47 = v102;
        }
        if (v47) {
          v103 = (char *)sub_2446D03E4((uint64_t)&self->_matterAttributeMetadata.__end_cap_, v47);
        }
        else {
          v103 = 0;
        }
        v104 = &v103[16 * v100];
        v105 = (EmberAfAttributeMetadata *)&v103[16 * v47];
        *(_DWORD *)v104 = 0;
        *((void *)v104 + 1) = 0x102100020000FFFDLL;
        v99 = (EmberAfAttributeMetadata *)(v104 + 16);
        v107 = self->_matterAttributeMetadata.__begin_;
        v106 = self->_matterAttributeMetadata.__end_;
        if (v106 != v107)
        {
          do
          {
            *((_OWORD *)v104 - 1) = *((_OWORD *)v106 - 1);
            v104 -= 16;
            v106 = (EmberAfAttributeMetadata *)((char *)v106 - 16);
          }
          while (v106 != v107);
          v106 = p_matterAttributeMetadata->__begin_;
        }
        self->_matterAttributeMetadata.__begin_ = (EmberAfAttributeMetadata *)v104;
        self->_matterAttributeMetadata.__end_ = v99;
        self->_matterAttributeMetadata.__end_cap_.__value_ = v105;
        if (v106) {
          operator delete(v106);
        }
      }
      else
      {
        *(_DWORD *)v81 = 0;
        *((void *)v81 + 1) = 0x102100020000FFFDLL;
        v99 = (EmberAfAttributeMetadata *)((char *)v81 + 16);
      }
      self->_matterAttributeMetadata.__end_ = v99;
      objc_msgSend_unsignedLongLongValue(self->_clusterID, (const char *)v47, v48);
      operator new();
    }
    v69 = sub_244CC8484(0, "NotSpecified");
    if (os_log_type_enabled(v69, OS_LOG_TYPE_ERROR))
    {
      unsigned __int16 v72 = objc_msgSend_unsignedLongLongValue(self->_clusterID, v70, v71) >> 16;
      unsigned __int16 v75 = objc_msgSend_unsignedLongLongValue(self->_clusterID, v73, v74);
      buf[0] = 134218496;
      *(void *)&buf[1] = v110;
      __int16 v123 = 1024;
      *(_DWORD *)v124 = v72;
      *(_WORD *)&v124[4] = 1024;
      *(_DWORD *)&v124[6] = v75;
      _os_log_impl(&dword_2446BD000, v69, OS_LOG_TYPE_ERROR, "Unable to have %llu attributes in a single cluster (clusterID: 0x%04X_%04X)", (uint8_t *)buf, 0x18u);
    }

    if (sub_244CC4E58(1u))
    {
      objc_msgSend_unsignedLongLongValue(self->_clusterID, v76, v77);
      objc_msgSend_unsignedLongLongValue(self->_clusterID, v78, v79);
      sub_244CC4DE0(0, 1);
    }
  }

  os_unfair_lock_unlock(lock);
  return 0;
}

- (void)invalidate
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  p_os_unfair_lock_t lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v4 = self->_attributes;
  uint64_t v8 = objc_msgSend_countByEnumeratingWithState_objects_count_(v4, v5, (uint64_t)&v18, v22, 16);
  if (v8)
  {
    uint64_t v9 = *(void *)v19;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v19 != v9) {
          objc_enumerationMutation(v4);
        }
        objc_msgSend_invalidate(*(void **)(*((void *)&v18 + 1) + 8 * v10++), v6, v7, (void)v18);
      }
      while (v8 != v10);
      uint64_t v8 = objc_msgSend_countByEnumeratingWithState_objects_count_(v4, v6, (uint64_t)&v18, v22, 16);
    }
    while (v8);
  }

  objc_msgSend_set(MEMORY[0x263EFFA08], v11, v12);
  uint64_t v13 = (NSSet *)objc_claimAutoreleasedReturnValue();
  matterAccessGrants = self->_matterAccessGrants;
  self->_matterAccessGrants = v13;

  value = self->_attributeAccessInterface.__ptr_.__value_;
  self->_matterAttributeMetadata.__end_ = self->_matterAttributeMetadata.__begin_;
  self->_attributeAccessInterface.__ptr_.__value_ = 0;
  if (value) {
    (*(void (**)(MTRServerAttributeAccessInterface *))(*(void *)value + 8))(value);
  }
  uint64_t v16 = self->_matterAcceptedCommandList.__ptr_.__value_;
  self->_matterAcceptedCommandList.__ptr_.__value_ = 0;
  if (v16) {
    MEMORY[0x245695F80](v16, 0x1000C8052888210);
  }
  v17 = self->_matterGeneratedCommandList.__ptr_.__value_;
  self->_matterGeneratedCommandList.__ptr_.__value_ = 0;
  if (v17) {
    MEMORY[0x245695F80](v17, 0x1000C8052888210);
  }
  objc_storeWeak((id *)&self->_deviceController, 0);
  os_unfair_lock_unlock(p_lock);
}

- (void)registerMatterCluster
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  sub_244D6A434("/Library/Caches/com.apple.xbs/Sources/CHIPFramework/connectedhomeip/src/darwin/Framework/CHIP/ServerEndpoint/MTRServerCluster.mm", 378);
  os_unfair_lock_lock(&self->_lock);
  v3 = sub_244CB24F4();
  if (!sub_244CB2674((uint64_t)v3, (uint64_t)self->_attributeAccessInterface.__ptr_.__value_))
  {
    id v4 = sub_244CC8484(0, "NotSpecified");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      int parentEndpoint = self->_parentEndpoint;
      uint64_t v8 = objc_msgSend_unsignedLongLongValue(self->_clusterID, v5, v6);
      *(_DWORD *)buf = 67109376;
      int v12 = parentEndpoint;
      __int16 v13 = 2048;
      uint64_t v14 = v8;
      _os_log_impl(&dword_2446BD000, v4, OS_LOG_TYPE_ERROR, "Could not register AttributeAccessInterface for endpoint %u, cluster 0x%llx", buf, 0x12u);
    }

    if (sub_244CC4E58(1u))
    {
      objc_msgSend_unsignedLongLongValue(self->_clusterID, v9, v10);
      sub_244CC4DE0(0, 1);
    }
  }
  os_unfair_lock_unlock(&self->_lock);
}

- (void)unregisterMatterCluster
{
  sub_244D6A434("/Library/Caches/com.apple.xbs/Sources/CHIPFramework/connectedhomeip/src/darwin/Framework/CHIP/ServerEndpoint/MTRServerCluster.mm", 392);
  os_unfair_lock_lock(&self->_lock);
  if (self->_attributeAccessInterface.__ptr_.__value_)
  {
    v3 = sub_244CB24F4();
    sub_244CB256C(v3, (uint64_t)self->_attributeAccessInterface.__ptr_.__value_);
  }

  os_unfair_lock_unlock(&self->_lock);
}

- (NSArray)accessGrants
{
  p_os_unfair_lock_t lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  uint64_t v6 = objc_msgSend_allObjects(self->_accessGrants, v4, v5);
  os_unfair_lock_unlock(p_lock);

  return (NSArray *)v6;
}

- (NSArray)attributes
{
  p_os_unfair_lock_t lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  uint64_t v6 = objc_msgSend_copy(self->_attributes, v4, v5);
  os_unfair_lock_unlock(p_lock);

  return (NSArray *)v6;
}

- (BOOL)addToEndpoint:(unsigned __int16)a3
{
  int v3 = a3;
  uint64_t v43 = *MEMORY[0x263EF8340];
  p_os_unfair_lock_t lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  int parentEndpoint = self->_parentEndpoint;
  if (parentEndpoint == 0xFFFF)
  {
    self->_int parentEndpoint = v3;
    long long v30 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    long long v19 = self->_attributes;
    uint64_t v23 = objc_msgSend_countByEnumeratingWithState_objects_count_(v19, v20, (uint64_t)&v30, v34, 16);
    if (v23)
    {
      uint64_t v24 = *(void *)v31;
      do
      {
        for (uint64_t i = 0; i != v23; ++i)
        {
          if (*(void *)v31 != v24) {
            objc_enumerationMutation(v19);
          }
          int v26 = *(void **)(*((void *)&v30 + 1) + 8 * i);
          int v27 = objc_msgSend_unsignedLongLongValue(self->_clusterID, v21, v22);
          *(_WORD *)buf = v3;
          int v36 = v27;
          objc_msgSend_updateParentCluster_(v26, v28, (uint64_t)buf);
        }
        uint64_t v23 = objc_msgSend_countByEnumeratingWithState_objects_count_(v19, v21, (uint64_t)&v30, v34, 16);
      }
      while (v23);
    }
  }
  else
  {
    uint64_t v7 = sub_244CC8484(0, "NotSpecified");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      unsigned __int16 v10 = objc_msgSend_unsignedLongLongValue(self->_clusterID, v8, v9) >> 16;
      unsigned __int16 v13 = objc_msgSend_unsignedLongLongValue(self->_clusterID, v11, v12);
      int v14 = self->_parentEndpoint;
      *(_DWORD *)buf = 67109888;
      int v36 = v10;
      __int16 v37 = 1024;
      int v38 = v13;
      __int16 v39 = 1024;
      int v40 = v3;
      __int16 v41 = 1024;
      int v42 = v14;
      _os_log_impl(&dword_2446BD000, v7, OS_LOG_TYPE_ERROR, "Cannot add cluster 0x%04X_%04X to endpoint %u; already added to endpoint %u",
        buf,
        0x1Au);
    }

    if (sub_244CC4E58(1u))
    {
      objc_msgSend_unsignedLongLongValue(self->_clusterID, v15, v16);
      objc_msgSend_unsignedLongLongValue(self->_clusterID, v17, v18);
      sub_244CC4DE0(0, 1);
    }
  }
  os_unfair_lock_unlock(p_lock);
  return parentEndpoint == 0xFFFF;
}

- (unsigned)parentEndpoint
{
  v2 = self;
  p_os_unfair_lock_t lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  LOWORD(v2) = v2->_parentEndpoint;
  os_unfair_lock_unlock(p_lock);
  return (unsigned __int16)v2;
}

- (Span<const)matterAttributeMetadata
{
  p_os_unfair_lock_t lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  sub_2446D0450(v6, (uint64_t)self->_matterAttributeMetadata.__begin_, (self->_matterAttributeMetadata.__end_ - self->_matterAttributeMetadata.__begin_) >> 4);
  os_unfair_lock_unlock(p_lock);
  id v4 = (EmberAfAttributeMetadata *)v6[0];
  unint64_t v5 = v6[1];
  result.var1 = v5;
  result.var0 = v4;
  return result;
}

- (void)setAcceptedCommands:(id)a3
{
  id v8 = a3;
  os_unfair_lock_lock(&self->_lock);
  uint64_t v6 = (NSArray *)objc_msgSend_copy(v8, v4, v5);
  acceptedCommands = self->_acceptedCommands;
  self->_acceptedCommands = v6;

  os_unfair_lock_unlock(&self->_lock);
}

- (NSArray)acceptedCommands
{
  p_os_unfair_lock_t lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  uint64_t v6 = objc_msgSend_copy(self->_acceptedCommands, v4, v5);
  os_unfair_lock_unlock(p_lock);

  return (NSArray *)v6;
}

- (void)setGeneratedCommands:(id)a3
{
  id v8 = a3;
  os_unfair_lock_lock(&self->_lock);
  uint64_t v6 = (NSArray *)objc_msgSend_copy(v8, v4, v5);
  generatedCommands = self->_generatedCommands;
  self->_generatedCommands = v6;

  os_unfair_lock_unlock(&self->_lock);
}

- (NSArray)generatedCommands
{
  p_os_unfair_lock_t lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  uint64_t v6 = objc_msgSend_copy(self->_generatedCommands, v4, v5);
  os_unfair_lock_unlock(p_lock);

  return (NSArray *)v6;
}

- (unsigned)matterAcceptedCommands
{
  p_os_unfair_lock_t lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  value = self->_matterAcceptedCommandList.__ptr_.__value_;
  os_unfair_lock_unlock(p_lock);
  return value;
}

- (unsigned)matterGeneratedCommands
{
  p_os_unfair_lock_t lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  value = self->_matterGeneratedCommandList.__ptr_.__value_;
  os_unfair_lock_unlock(p_lock);
  return value;
}

- (id)description
{
  p_os_unfair_lock_t lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  id v4 = sub_2446CF168((os_unfair_lock *)self);
  os_unfair_lock_unlock(p_lock);

  return v4;
}

- (NSNumber)clusterID
{
  return (NSNumber *)objc_getProperty(self, a2, 120, 1);
}

- (NSNumber)clusterRevision
{
  return (NSNumber *)objc_getProperty(self, a2, 128, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clusterRevision, 0);
  objc_storeStrong((id *)&self->_clusterID, 0);
  objc_storeStrong((id *)&self->_generatedCommands, 0);
  objc_storeStrong((id *)&self->_acceptedCommands, 0);
  objc_storeStrong((id *)&self->_matterAccessGrants, 0);
  value = self->_matterGeneratedCommandList.__ptr_.__value_;
  self->_matterGeneratedCommandList.__ptr_.__value_ = 0;
  if (value) {
    MEMORY[0x245695F80](value, 0x1000C8052888210);
  }
  id v4 = self->_matterAcceptedCommandList.__ptr_.__value_;
  self->_matterAcceptedCommandList.__ptr_.__value_ = 0;
  if (v4) {
    MEMORY[0x245695F80](v4, 0x1000C8052888210);
  }
  begin = self->_matterAttributeMetadata.__begin_;
  if (begin)
  {
    self->_matterAttributeMetadata.__end_ = begin;
    operator delete(begin);
  }
  uint64_t v6 = self->_attributeAccessInterface.__ptr_.__value_;
  self->_attributeAccessInterface.__ptr_.__value_ = 0;
  if (v6) {
    (*(void (**)(MTRServerAttributeAccessInterface *))(*(void *)v6 + 8))(v6);
  }
  objc_destroyWeak((id *)&self->_deviceController);
  objc_storeStrong((id *)&self->_attributes, 0);

  objc_storeStrong((id *)&self->_accessGrants, 0);
}

- (id).cxx_construct
{
  *((_OWORD *)self + 3) = 0u;
  *((_OWORD *)self + 4) = 0u;
  *((_OWORD *)self + 2) = 0u;
  return self;
}

@end