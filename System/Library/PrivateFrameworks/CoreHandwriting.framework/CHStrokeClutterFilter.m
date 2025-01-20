@interface CHStrokeClutterFilter
- (BOOL)isEmpty;
- (BOOL)isHighDensityStroke:(id)a3;
- (CHStrokeClutterFilter)init;
- (id)clutterFilterByAddingStrokes:(id)a3 removingStrokeIdentifiers:(id)a4 affectedStrokeIdentifiers:(id *)a5;
- (id)copyWithZone:(_NSZone *)a3;
- (id)strokeIDsWithinRectangleRegion:(CGRect *)a3;
- (int64_t)highDensityStrokeCount;
- (void)dealloc;
@end

@implementation CHStrokeClutterFilter

- (CHStrokeClutterFilter)init
{
  v3.receiver = self;
  v3.super_class = (Class)CHStrokeClutterFilter;
  if ([(CHStrokeClutterFilter *)&v3 init]) {
    operator new();
  }
  return 0;
}

- (void)dealloc
{
  heatMap = self->_heatMap;
  if (heatMap)
  {
    v4 = sub_1C4AA1364(heatMap);
    MEMORY[0x1C8786460](v4, 0x10A0C402E9B2A30);
  }
  v5.receiver = self;
  v5.super_class = (Class)CHStrokeClutterFilter;
  [(CHStrokeClutterFilter *)&v5 dealloc];
}

- (id)copyWithZone:(_NSZone *)a3
{
  v7 = objc_msgSend_allocWithZone_(CHStrokeClutterFilter, a2, (uint64_t)a3, v3, v4, v5);
  heatMap = self->_heatMap;
  CHStrokeID2HeatmapItemID = self->_CHStrokeID2HeatmapItemID;
  heatmapItemID2CHStrokeID = self->_heatmapItemID2CHStrokeID;
  return sub_1C4A9F9EC(v7, (uint64_t)heatMap, CHStrokeID2HeatmapItemID, heatmapItemID2CHStrokeID);
}

- (id)clutterFilterByAddingStrokes:(id)a3 removingStrokeIdentifiers:(id)a4 affectedStrokeIdentifiers:(id *)a5
{
  a3;
  a4;
  objc_msgSend_mutableCopy(self->_CHStrokeID2HeatmapItemID, v7, v8, v9, v10, v11);
  objc_msgSend_mutableCopy(self->_heatmapItemID2CHStrokeID, v12, v13, v14, v15, v16);
  operator new();
}

- (BOOL)isHighDensityStroke:(id)a3
{
  v7 = objc_msgSend_objectForKey_(self->_CHStrokeID2HeatmapItemID, a2, (uint64_t)a3, v3, v4, v5);
  uint64_t v13 = v7;
  if (v7)
  {
    unint64_t v14 = objc_msgSend_unsignedLongValue(v7, v8, v9, v10, v11, v12);
    heatMap = (int8x8_t *)self->_heatMap;
    int8x8_t v16 = heatMap[7];
    if (v16)
    {
      uint8x8_t v17 = (uint8x8_t)vcnt_s8(v16);
      v17.i16[0] = vaddlv_u8(v17);
      if (v17.u32[0] > 1uLL)
      {
        unint64_t v18 = v14;
        if (*(void *)&v16 <= v14) {
          unint64_t v18 = v14 % *(void *)&v16;
        }
      }
      else
      {
        unint64_t v18 = (*(void *)&v16 - 1) & v14;
      }
      v20 = *(void **)(*(void *)&heatMap[6] + 8 * v18);
      if (v20)
      {
        v20 = (void *)*v20;
        if (v20)
        {
          if (v17.u32[0] < 2uLL)
          {
            uint64_t v21 = *(void *)&v16 - 1;
            while (1)
            {
              uint64_t v23 = v20[1];
              if (v23 == v14)
              {
                if (v20[2] == v14) {
                  goto LABEL_24;
                }
              }
              else if ((v23 & v21) != v18)
              {
                goto LABEL_23;
              }
              v20 = (void *)*v20;
              if (!v20) {
                goto LABEL_24;
              }
            }
          }
          do
          {
            unint64_t v22 = v20[1];
            if (v22 == v14)
            {
              if (v20[2] == v14) {
                break;
              }
            }
            else
            {
              if (v22 >= *(void *)&v16) {
                v22 %= *(void *)&v16;
              }
              if (v22 != v18) {
                goto LABEL_23;
              }
            }
            v20 = (void *)*v20;
          }
          while (v20);
        }
      }
    }
    else
    {
LABEL_23:
      v20 = 0;
    }
LABEL_24:
    BOOL v24 = v20 != 0;

    return v24;
  }
  else
  {

    return 0;
  }
}

- (int64_t)highDensityStrokeCount
{
  return *((void *)self->_heatMap + 9);
}

- (BOOL)isEmpty
{
  return objc_msgSend_count(self->_CHStrokeID2HeatmapItemID, a2, v2, v3, v4, v5) == 0;
}

- (id)strokeIDsWithinRectangleRegion:(CGRect *)a3
{
  uint64_t v68 = *MEMORY[0x1E4F143B8];
  uint64_t v8 = objc_msgSend_count(self->_CHStrokeID2HeatmapItemID, a2, (uint64_t)a3, v3, v4, v5);
  if (v8 != objc_msgSend_count(self->_heatmapItemID2CHStrokeID, v9, v10, v11, v12, v13))
  {
    if (qword_1EA3CA000 != -1) {
      dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
    }
    v19 = (id)qword_1EA3C9F90[0];
    if (os_log_type_enabled(v19, OS_LOG_TYPE_FAULT))
    {
      uint64_t v25 = objc_msgSend_count(self->_CHStrokeID2HeatmapItemID, v20, v21, v22, v23, v24);
      uint64_t v31 = objc_msgSend_count(self->_heatmapItemID2CHStrokeID, v26, v27, v28, v29, v30);
      *(_DWORD *)buf = 134218240;
      *(void *)&buf[4] = v25;
      *(_WORD *)&buf[12] = 2048;
      *(void *)&buf[14] = v31;
      _os_log_impl(&dword_1C492D000, v19, OS_LOG_TYPE_FAULT, "calling strokeIDsWithinRegionOfInterest() while clutter filter being in inconsistent status: %lu <==> %lu", buf, 0x16u);
    }
  }
  v37 = objc_msgSend_set(MEMORY[0x1E4F1CA80], v14, v15, v16, v17, v18);
  if (self->_heatMap && objc_msgSend_count(self->_CHStrokeID2HeatmapItemID, v32, v33, v34, v35, v36))
  {
    heatMap = (unint64_t *)self->_heatMap;
    memset(buf, 0, sizeof(buf));
    int v67 = 1065353216;
    v39 = (void *)heatMap[13];
    if (v39)
    {
      v40 = (CGRect *)MEMORY[0x1E4F1DB28];
      do
      {
        v70.origin.x = (double)(uint64_t)(*heatMap * v39[2]);
        v70.origin.y = (double)(uint64_t)(*heatMap * v39[3]);
        v70.size.width = (double)*heatMap;
        v70.size.height = v70.size.width;
        CGRect v71 = CGRectIntersection(v70, *a3);
        if (!CGRectEqualToRect(v71, *v40))
        {
          for (i = (void *)v39[6]; i; i = (void *)*i)
            sub_1C4AA1490((uint64_t)buf, i + 2, i + 2);
        }
        v39 = (void *)*v39;
      }
      while (v39);
      v47 = *(void **)&buf[16];
      if (*(void *)&buf[16])
      {
        *(void *)&long long v45 = 138412290;
        long long v63 = v45;
        while (1)
        {
          v48 = objc_msgSend_numberWithUnsignedLong_(NSNumber, v41, v47[2], v42, v43, v44, v63);
          v57 = objc_msgSend_objectForKey_(self->_heatmapItemID2CHStrokeID, v49, (uint64_t)v48, v50, v51, v52);
          if (!v57) {
            break;
          }
LABEL_23:
          objc_msgSend_addObject_(v37, v53, (uint64_t)v57, v54, v55, v56);

          v47 = (void *)*v47;
          if (!v47)
          {
            v59 = *(void **)&buf[16];
            if (*(void *)&buf[16])
            {
              do
              {
                v60 = (void *)*v59;
                operator delete(v59);
                v59 = v60;
              }
              while (v60);
            }
            goto LABEL_29;
          }
        }
        if (qword_1EA3CA000 == -1)
        {
          v58 = (id)qword_1EA3C9F90[0];
          if (!os_log_type_enabled(v58, OS_LOG_TYPE_FAULT))
          {
LABEL_22:

            goto LABEL_23;
          }
        }
        else
        {
          dispatch_once(&qword_1EA3CA000, &unk_1F2012B50);
          v58 = (id)qword_1EA3C9F90[0];
          if (!os_log_type_enabled(v58, OS_LOG_TYPE_FAULT)) {
            goto LABEL_22;
          }
        }
        *(_DWORD *)v64 = v63;
        v65 = v48;
        _os_log_impl(&dword_1C492D000, v58, OS_LOG_TYPE_FAULT, "Cannot find corresponding stroke ID given the item ID: %@", v64, 0xCu);
        goto LABEL_22;
      }
LABEL_29:
      v61 = *(void **)buf;
      *(void *)buf = 0;
      if (v61) {
        operator delete(v61);
      }
    }
    else
    {
      *(void *)buf = 0;
    }
  }
  return v37;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_heatmapItemID2CHStrokeID, 0);
  objc_storeStrong((id *)&self->_CHStrokeID2HeatmapItemID, 0);
}

@end