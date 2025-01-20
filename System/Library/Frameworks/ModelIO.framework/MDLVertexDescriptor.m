@interface MDLVertexDescriptor
+ (id)_decodeVertexDescriptorAttributesWithCoder:(id)a3;
+ (id)_decodeVertexDescriptorLayoutsWithCoder:(id)a3;
+ (id)decodeVertexDescriptorWithCoder:(id)a3;
- (BOOL)isEqual:(id)a3;
- (MDLVertexAttribute)attributeNamed:(NSString *)name;
- (MDLVertexDescriptor)init;
- (MDLVertexDescriptor)initWithVertexDescriptor:(MDLVertexDescriptor *)vertexDescriptor;
- (NSMutableArray)attributes;
- (NSMutableArray)layouts;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)hash;
- (void)_encodeVertexDescriptorAttributesWithCoder:(id)a3;
- (void)_encodeVertexDescriptorLayoutsWithCoder:(id)a3;
- (void)addOrReplaceAttribute:(MDLVertexAttribute *)attribute;
- (void)debugPrintToFile:(__sFILE *)a3;
- (void)encodeVertexDescriptorWithCoder:(id)a3;
- (void)removeAttributeNamed:(NSString *)name;
- (void)reset;
- (void)setAttributes:(NSMutableArray *)attributes;
- (void)setLayouts:(NSMutableArray *)layouts;
- (void)setPackedOffsets;
- (void)setPackedStrides;
@end

@implementation MDLVertexDescriptor

- (MDLVertexDescriptor)init
{
  v21.receiver = self;
  v21.super_class = (Class)MDLVertexDescriptor;
  v2 = [(MDLVertexDescriptor *)&v21 init];
  if (v2)
  {
    id v3 = objc_alloc(MEMORY[0x263EFF980]);
    uint64_t v5 = objc_msgSend_initWithCapacity_(v3, v4, 31);
    attributes = v2->_attributes;
    v2->_attributes = (NSMutableArray *)v5;

    int v7 = 31;
    do
    {
      v8 = v2->_attributes;
      v9 = objc_opt_new();
      objc_msgSend_addObject_(v8, v10, (uint64_t)v9);

      --v7;
    }
    while (v7);
    id v11 = objc_alloc(MEMORY[0x263EFF980]);
    uint64_t v13 = objc_msgSend_initWithCapacity_(v11, v12, 31);
    layouts = v2->_layouts;
    v2->_layouts = (NSMutableArray *)v13;

    int v15 = 31;
    do
    {
      v16 = v2->_layouts;
      v17 = objc_opt_new();
      objc_msgSend_addObject_(v16, v18, (uint64_t)v17);

      --v15;
    }
    while (v15);
    v19 = v2;
  }

  return v2;
}

- (MDLVertexDescriptor)initWithVertexDescriptor:(MDLVertexDescriptor *)vertexDescriptor
{
  uint64_t v64 = *MEMORY[0x263EF8340];
  v4 = vertexDescriptor;
  v61.receiver = self;
  v61.super_class = (Class)MDLVertexDescriptor;
  uint64_t v5 = [(MDLVertexDescriptor *)&v61 init];
  if (v5)
  {
    id v6 = objc_alloc(MEMORY[0x263EFF980]);
    v9 = objc_msgSend_attributes(v4, v7, v8);
    uint64_t v12 = objc_msgSend_count(v9, v10, v11);
    uint64_t v14 = objc_msgSend_initWithCapacity_(v6, v13, v12);
    attributes = v5->_attributes;
    v5->_attributes = (NSMutableArray *)v14;

    long long v59 = 0u;
    long long v60 = 0u;
    long long v57 = 0u;
    long long v58 = 0u;
    v18 = objc_msgSend_attributes(v4, v16, v17);
    uint64_t v20 = objc_msgSend_countByEnumeratingWithState_objects_count_(v18, v19, (uint64_t)&v57, v63, 16);
    if (v20)
    {
      uint64_t v21 = *(void *)v58;
      do
      {
        uint64_t v22 = 0;
        do
        {
          if (*(void *)v58 != v21) {
            objc_enumerationMutation(v18);
          }
          v23 = *(void **)(*((void *)&v57 + 1) + 8 * v22);
          uint64_t v24 = MEMORY[0x2105306E0]();
          v26 = objc_msgSend_copyWithZone_(v23, v25, v24);
          objc_msgSend_addObject_(v5->_attributes, v27, (uint64_t)v26);

          ++v22;
        }
        while (v20 != v22);
        uint64_t v20 = objc_msgSend_countByEnumeratingWithState_objects_count_(v18, v28, (uint64_t)&v57, v63, 16);
      }
      while (v20);
    }

    id v29 = objc_alloc(MEMORY[0x263EFF980]);
    v32 = objc_msgSend_layouts(v4, v30, v31);
    uint64_t v35 = objc_msgSend_count(v32, v33, v34);
    uint64_t v37 = objc_msgSend_initWithCapacity_(v29, v36, v35);
    layouts = v5->_layouts;
    v5->_layouts = (NSMutableArray *)v37;

    long long v55 = 0u;
    long long v56 = 0u;
    long long v53 = 0u;
    long long v54 = 0u;
    v41 = objc_msgSend_layouts(v4, v39, v40, 0);
    uint64_t v43 = objc_msgSend_countByEnumeratingWithState_objects_count_(v41, v42, (uint64_t)&v53, v62, 16);
    if (v43)
    {
      uint64_t v44 = *(void *)v54;
      do
      {
        uint64_t v45 = 0;
        do
        {
          if (*(void *)v54 != v44) {
            objc_enumerationMutation(v41);
          }
          v46 = *(void **)(*((void *)&v53 + 1) + 8 * v45);
          uint64_t v47 = MEMORY[0x2105306E0]();
          v49 = objc_msgSend_copyWithZone_(v46, v48, v47);
          objc_msgSend_addObject_(v5->_layouts, v50, (uint64_t)v49);

          ++v45;
        }
        while (v43 != v45);
        uint64_t v43 = objc_msgSend_countByEnumeratingWithState_objects_count_(v41, v51, (uint64_t)&v53, v62, 16);
      }
      while (v43);
    }
  }
  return v5;
}

- (MDLVertexAttribute)attributeNamed:(NSString *)name
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  v4 = name;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  int v7 = objc_msgSend_attributes(self, v5, v6, 0);
  id v11 = (id)objc_msgSend_countByEnumeratingWithState_objects_count_(v7, v8, (uint64_t)&v19, v23, 16);
  if (v11)
  {
    uint64_t v12 = *(void *)v20;
    while (2)
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(void *)v20 != v12) {
          objc_enumerationMutation(v7);
        }
        uint64_t v14 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        if (objc_msgSend_format(v14, v9, v10))
        {
          int v15 = objc_msgSend_name(v14, v9, v10);
          char isEqualToString = objc_msgSend_isEqualToString_(v4, v16, (uint64_t)v15);

          if (isEqualToString)
          {
            id v11 = v14;
            goto LABEL_12;
          }
        }
      }
      id v11 = (id)objc_msgSend_countByEnumeratingWithState_objects_count_(v7, v9, (uint64_t)&v19, v23, 16);
      if (v11) {
        continue;
      }
      break;
    }
  }
LABEL_12:

  return (MDLVertexAttribute *)v11;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = [MDLVertexDescriptor alloc];

  return (id)objc_msgSend_initWithVertexDescriptor_(v4, v5, (uint64_t)self);
}

- (void)addOrReplaceAttribute:(MDLVertexAttribute *)attribute
{
  v46 = attribute;
  for (unsigned int i = 0; ; unsigned int i = v9 + 1)
  {
    uint64_t v9 = i;
    if (objc_msgSend_count(self->_attributes, v4, v5) <= (unint64_t)i) {
      break;
    }
    uint64_t v10 = objc_msgSend_objectAtIndexedSubscript_(self->_attributes, v7, i);
    objc_msgSend_time(v10, v11, v12);
    double v14 = v13;
    objc_msgSend_time(v46, v15, v16);
    if (v14 != v18) {
      goto LABEL_8;
    }
    long long v19 = objc_msgSend_objectAtIndexedSubscript_(self->_attributes, v17, v9);
    v23 = objc_msgSend_name(v19, v20, v21);
    if (!v23)
    {

LABEL_8:
      continue;
    }
    uint64_t v24 = objc_msgSend_objectAtIndexedSubscript_(self->_attributes, v22, v9);
    v27 = objc_msgSend_name(v24, v25, v26);
    v30 = objc_msgSend_name(v46, v28, v29);
    int isEqualToString = objc_msgSend_isEqualToString_(v27, v31, (uint64_t)v30);

    if (isEqualToString)
    {
      objc_msgSend_setObject_atIndexedSubscript_(self->_attributes, v4, (uint64_t)v46, v9);
      uint64_t v45 = v46;
      goto LABEL_15;
    }
  }
  unsigned int v33 = 0;
  while (1)
  {
    unint64_t v35 = objc_msgSend_count(self->_attributes, v7, v8);
    uint64_t v36 = v33;
    attributes = self->_attributes;
    if (v35 <= v33) {
      break;
    }
    v38 = objc_msgSend_objectAtIndexedSubscript_(attributes, v34, v33);
    uint64_t v41 = objc_msgSend_format(v38, v39, v40);

    unsigned int v33 = v36 + 1;
    if (!v41)
    {
      objc_msgSend_setObject_atIndexedSubscript_(self->_attributes, v7, (uint64_t)v46, v36);
      uint64_t v45 = v46;
      goto LABEL_15;
    }
  }
  objc_msgSend_addObject_(attributes, v34, (uint64_t)v46);
  layouts = self->_layouts;
  uint64_t v43 = objc_alloc_init(MDLVertexBufferLayout);
  objc_msgSend_addObject_(layouts, v44, (uint64_t)v43);

  uint64_t v45 = v46;
LABEL_15:
}

- (void)removeAttributeNamed:(NSString *)name
{
  v23 = name;
  for (unsigned int i = 0; objc_msgSend_count(self->_attributes, v4, v5) > (unint64_t)i; ++i)
  {
    uint64_t v8 = objc_msgSend_objectAtIndexedSubscript_(self->_attributes, v7, i);
    uint64_t v12 = objc_msgSend_name(v8, v9, v10);
    if (v12)
    {
      double v13 = objc_msgSend_objectAtIndexedSubscript_(self->_attributes, v11, i);
      uint64_t v16 = objc_msgSend_name(v13, v14, v15);
      int isEqualToString = objc_msgSend_isEqualToString_(v16, v17, (uint64_t)v23);

      if (!isEqualToString) {
        continue;
      }
      long long v19 = objc_msgSend_objectAtIndexedSubscript_(self->_attributes, v4, i);
      objc_msgSend_setName_(v19, v20, (uint64_t)&stru_26BF51EF0);

      uint64_t v8 = objc_msgSend_objectAtIndexedSubscript_(self->_attributes, v21, i);
      objc_msgSend_setFormat_(v8, v22, 0);
    }
  }
}

- (void)reset
{
  id v3 = objc_alloc(MEMORY[0x263EFF980]);
  int v4 = 31;
  uint64_t v6 = (NSMutableArray *)objc_msgSend_initWithCapacity_(v3, v5, 31);
  attributes = self->_attributes;
  self->_attributes = v6;

  id v8 = objc_alloc(MEMORY[0x263EFF980]);
  uint64_t v10 = (NSMutableArray *)objc_msgSend_initWithCapacity_(v8, v9, 31);
  layouts = self->_layouts;
  self->_layouts = v10;

  do
  {
    uint64_t v12 = self->_attributes;
    double v13 = objc_opt_new();
    objc_msgSend_addObject_(v12, v14, (uint64_t)v13);

    uint64_t v15 = self->_layouts;
    uint64_t v16 = objc_opt_new();
    objc_msgSend_addObject_(v15, v17, (uint64_t)v16);

    --v4;
  }
  while (v4);
}

- (void)setPackedStrides
{
  uint64_t v71 = *MEMORY[0x263EF8340];
  id v55 = objc_alloc_init(MEMORY[0x263EFF9C0]);
  long long v64 = 0u;
  long long v65 = 0u;
  long long v66 = 0u;
  long long v67 = 0u;
  obuint64_t j = self->_attributes;
  uint64_t v6 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v3, (uint64_t)&v64, v70, 16);
  if (v6)
  {
    uint64_t v7 = *(void *)v65;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v65 != v7) {
          objc_enumerationMutation(obj);
        }
        uint64_t v9 = NSNumber;
        uint64_t v10 = objc_msgSend_bufferIndex(*(void **)(*((void *)&v64 + 1) + 8 * i), v4, v5);
        uint64_t v12 = objc_msgSend_numberWithUnsignedLong_(v9, v11, v10);
        objc_msgSend_addObject_(v55, v13, (uint64_t)v12);
      }
      uint64_t v6 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v4, (uint64_t)&v64, v70, 16);
    }
    while (v6);
  }

  long long v62 = 0u;
  long long v63 = 0u;
  long long v60 = 0u;
  long long v61 = 0u;
  id obja = v55;
  uint64_t v15 = objc_msgSend_countByEnumeratingWithState_objects_count_(obja, v14, (uint64_t)&v60, v69, 16);
  if (v15)
  {
    uint64_t v51 = *(void *)v61;
    do
    {
      uint64_t v52 = v15;
      for (uint64_t j = 0; j != v52; ++j)
      {
        if (*(void *)v61 != v51) {
          objc_enumerationMutation(obja);
        }
        long long v19 = *(void **)(*((void *)&v60 + 1) + 8 * j);
        for (unint64_t k = objc_msgSend_count(self->_layouts, v16, v17, v51); ; ++k)
        {
          unint64_t v23 = objc_msgSend_unsignedLongValue(v19, v20, v21);
          layouts = self->_layouts;
          if (k >= v23) {
            break;
          }
          v27 = objc_alloc_init(MDLVertexBufferLayout);
          objc_msgSend_addObject_(layouts, v28, (uint64_t)v27);
        }
        uint64_t v29 = objc_msgSend_unsignedLongValue(v19, v24, v25);
        uint64_t v31 = objc_msgSend_objectAtIndexedSubscript_(layouts, v30, v29);
        v31[1] = 0;

        long long v58 = 0u;
        long long v59 = 0u;
        long long v56 = 0u;
        long long v57 = 0u;
        v32 = self->_attributes;
        uint64_t v36 = objc_msgSend_countByEnumeratingWithState_objects_count_(v32, v33, (uint64_t)&v56, v68, 16);
        if (v36)
        {
          uint64_t v37 = *(void *)v57;
          do
          {
            for (uint64_t m = 0; m != v36; ++m)
            {
              if (*(void *)v57 != v37) {
                objc_enumerationMutation(v32);
              }
              v39 = *(void **)(*((void *)&v56 + 1) + 8 * m);
              uint64_t v40 = objc_msgSend_bufferIndex(v39, v34, v35);
              if (v40 == objc_msgSend_unsignedLongValue(v19, v41, v42))
              {
                uint64_t v43 = objc_msgSend_format(v39, v34, v35);
                uint64_t v44 = sub_20B1AB7B4(v43);
                uint64_t v45 = self->_layouts;
                uint64_t v48 = objc_msgSend_unsignedLongValue(v19, v46, v47);
                v50 = objc_msgSend_objectAtIndexedSubscript_(v45, v49, v48);
                v50[1] += v44;
              }
            }
            uint64_t v36 = objc_msgSend_countByEnumeratingWithState_objects_count_(v32, v34, (uint64_t)&v56, v68, 16);
          }
          while (v36);
        }
      }
      uint64_t v15 = objc_msgSend_countByEnumeratingWithState_objects_count_(obja, v16, (uint64_t)&v60, v69, 16);
    }
    while (v15);
  }
}

- (void)setPackedOffsets
{
  uint64_t v54 = *MEMORY[0x263EF8340];
  id v38 = objc_alloc_init(MEMORY[0x263EFF9C0]);
  long long v47 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  uint64_t v35 = self;
  obuint64_t j = self->_attributes;
  uint64_t v6 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v3, (uint64_t)&v47, v53, 16);
  if (v6)
  {
    uint64_t v7 = *(void *)v48;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v48 != v7) {
          objc_enumerationMutation(obj);
        }
        uint64_t v9 = NSNumber;
        uint64_t v10 = objc_msgSend_bufferIndex(*(void **)(*((void *)&v47 + 1) + 8 * i), v4, v5);
        uint64_t v12 = objc_msgSend_numberWithUnsignedLong_(v9, v11, v10);
        objc_msgSend_addObject_(v38, v13, (uint64_t)v12);
      }
      uint64_t v6 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v4, (uint64_t)&v47, v53, 16);
    }
    while (v6);
  }

  long long v45 = 0u;
  long long v46 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  id obja = v38;
  uint64_t v15 = objc_msgSend_countByEnumeratingWithState_objects_count_(obja, v14, (uint64_t)&v43, v52, 16);
  if (v15)
  {
    uint64_t v34 = *(void *)v44;
    do
    {
      for (uint64_t j = 0; j != v15; ++j)
      {
        if (*(void *)v44 != v34) {
          objc_enumerationMutation(obja);
        }
        uint64_t v17 = *(void **)(*((void *)&v43 + 1) + 8 * j);
        long long v39 = 0u;
        long long v40 = 0u;
        long long v41 = 0u;
        long long v42 = 0u;
        double v18 = v35->_attributes;
        uint64_t v22 = objc_msgSend_countByEnumeratingWithState_objects_count_(v18, v19, (uint64_t)&v39, v51, 16);
        if (v22)
        {
          uint64_t v23 = 0;
          uint64_t v24 = *(void *)v40;
          do
          {
            for (uint64_t k = 0; k != v22; ++k)
            {
              if (*(void *)v40 != v24) {
                objc_enumerationMutation(v18);
              }
              uint64_t v26 = *(void **)(*((void *)&v39 + 1) + 8 * k);
              uint64_t v27 = objc_msgSend_bufferIndex(v26, v20, v21, v34);
              if (v27 == objc_msgSend_unsignedLongValue(v17, v28, v29))
              {
                objc_msgSend_setOffset_(v26, v20, v23);
                uint64_t v32 = objc_msgSend_format(v26, v30, v31);
                v23 += sub_20B1AB7B4(v32);
              }
            }
            uint64_t v22 = objc_msgSend_countByEnumeratingWithState_objects_count_(v18, v20, (uint64_t)&v39, v51, 16);
          }
          while (v22);
        }
      }
      uint64_t v15 = objc_msgSend_countByEnumeratingWithState_objects_count_(obja, v33, (uint64_t)&v43, v52, 16);
    }
    while (v15);
  }
}

- (void)debugPrintToFile:(__sFILE *)a3
{
  uint64_t v58 = *MEMORY[0x263EF8340];
  long long v52 = 0u;
  long long v53 = 0u;
  long long v54 = 0u;
  long long v55 = 0u;
  obuint64_t j = self->_attributes;
  uint64_t v7 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v4, (uint64_t)&v52, v57, 16);
  if (v7)
  {
    uint64_t v45 = 0;
    uint64_t v8 = *(void *)v53;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v53 != v8) {
          objc_enumerationMutation(obj);
        }
        uint64_t v10 = *(void **)(*((void *)&v52 + 1) + 8 * i);
        objc_msgSend_null(MEMORY[0x263EFF9D0], v5, v6);
        id v11 = (id)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend_isEqual_(v10, v12, (uint64_t)v11) & 1) == 0)
        {
          BOOL v15 = objc_msgSend_format(v10, v13, v14) == 0;

          if (v15) {
            continue;
          }
          objc_msgSend_name(v10, v5, v6);
          id v11 = objc_claimAutoreleasedReturnValue();
          uint64_t v16 = a3;
          double v18 = (const char *)objc_msgSend_cStringUsingEncoding_(v11, v17, 4);
          uint64_t v21 = objc_msgSend_format(v10, v19, v20);
          uint64_t v22 = sub_20B15A488(v21);
          uint64_t v25 = objc_msgSend_offset(v10, v23, v24);
          uint64_t v28 = objc_msgSend_bufferIndex(v10, v26, v27);
          uint64_t v43 = v25;
          a3 = v16;
          fprintf(v16, "%lu %s %s off=%lu buf%lu\n", v45 + i, v18, v22, v43, v28);
        }
      }
      uint64_t v7 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v5, (uint64_t)&v52, v57, 16);
      v45 += i;
    }
    while (v7);
  }

  long long v50 = 0u;
  long long v51 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  id obja = self->_layouts;
  uint64_t v32 = objc_msgSend_countByEnumeratingWithState_objects_count_(obja, v29, (uint64_t)&v48, v56, 16);
  if (v32)
  {
    uint64_t v33 = 0;
    uint64_t v34 = *(void *)v49;
    do
    {
      for (uint64_t j = 0; j != v32; ++j)
      {
        if (*(void *)v49 != v34) {
          objc_enumerationMutation(obja);
        }
        uint64_t v36 = *(void **)(*((void *)&v48 + 1) + 8 * j);
        uint64_t v37 = objc_msgSend_null(MEMORY[0x263EFF9D0], v30, v31);
        if (objc_msgSend_isEqual_(v36, v38, (uint64_t)v37))
        {
        }
        else
        {
          BOOL v41 = objc_msgSend_stride(v36, v39, v40) == 0;

          if (!v41)
          {
            uint64_t v42 = objc_msgSend_stride(v36, v30, v31);
            fprintf(a3, "%lu stride=%lu\n", v33 + j, v42);
          }
        }
      }
      uint64_t v32 = objc_msgSend_countByEnumeratingWithState_objects_count_(obja, v30, (uint64_t)&v48, v56, 16);
      v33 += j;
    }
    while (v32);
  }
}

- (BOOL)isEqual:(id)a3
{
  int v4 = (MDLVertexDescriptor *)a3;
  if (self == v4)
  {
    char isEqualToArray = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v5 = v4;
      if (objc_msgSend_isEqualToArray_(self->_attributes, v6, v5[1])) {
        char isEqualToArray = objc_msgSend_isEqualToArray_(self->_layouts, v7, v5[2]);
      }
      else {
        char isEqualToArray = 0;
      }
    }
    else
    {
      char isEqualToArray = 0;
    }
  }

  return isEqualToArray;
}

- (unint64_t)hash
{
  uint64_t v4 = objc_msgSend_hash(self->_attributes, a2, v2);
  return objc_msgSend_hash(self->_layouts, v5, v6) ^ v4;
}

- (id)description
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  id v30 = objc_alloc_init(MEMORY[0x263EFF980]);
  id v3 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  long long v33 = 0u;
  long long v34 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  uint64_t v6 = objc_msgSend_attributes(self, v4, v5);
  uint64_t v10 = objc_msgSend_countByEnumeratingWithState_objects_count_(v6, v7, (uint64_t)&v31, v35, 16);
  if (v10)
  {
    uint64_t v11 = *(void *)v32;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v32 != v11) {
          objc_enumerationMutation(v6);
        }
        double v13 = *(void **)(*((void *)&v31 + 1) + 8 * i);
        if (objc_msgSend_format(v13, v8, v9))
        {
          objc_msgSend_addObject_(v30, v8, (uint64_t)v13);
          uint64_t v16 = objc_msgSend_bufferIndex(v13, v14, v15);
          long long v19 = objc_msgSend_layouts(self, v17, v18);
          uint64_t v21 = objc_msgSend_objectAtIndexedSubscript_(v19, v20, v16);
          uint64_t v23 = objc_msgSend_numberWithUnsignedInteger_(NSNumber, v22, v16);
          objc_msgSend_setObject_forKeyedSubscript_(v3, v24, (uint64_t)v21, v23);
        }
      }
      uint64_t v10 = objc_msgSend_countByEnumeratingWithState_objects_count_(v6, v8, (uint64_t)&v31, v35, 16);
    }
    while (v10);
  }

  uint64_t v25 = NSString;
  uint64_t v26 = objc_opt_class();
  uint64_t v28 = objc_msgSend_stringWithFormat_(v25, v27, @"<%@: %p attributes:%@ layouts:%@>", v26, self, v30, v3);

  return v28;
}

- (void)_encodeVertexDescriptorLayoutsWithCoder:(id)a3
{
  id v29 = a3;
  uint64_t v6 = objc_msgSend_layouts(self, v4, v5);
  uint64_t v9 = objc_msgSend_count(v6, v7, v8);

  objc_msgSend_encodeInt32_forKey_(v29, v10, v9, @"layouts.count");
  uint64_t v11 = v9 << 32;
  if (v9 << 32)
  {
    uint64_t v12 = 0;
    unint64_t v13 = v11 >> 32;
    if (v13 <= 1) {
      uint64_t v14 = 1;
    }
    else {
      uint64_t v14 = v13;
    }
    do
    {
      id v15 = [NSString alloc];
      uint64_t v17 = objc_msgSend_initWithFormat_(v15, v16, @"layouts[%zu]", v12);
      uint64_t v20 = objc_msgSend_layouts(self, v18, v19);
      uint64_t v22 = objc_msgSend_objectAtIndexedSubscript_(v20, v21, v12);

      uint64_t v25 = objc_msgSend_stride(v22, v23, v24);
      uint64_t v27 = objc_msgSend_stringByAppendingString_(v17, v26, @".stride");
      objc_msgSend_encodeInteger_forKey_(v29, v28, v25, v27);

      ++v12;
    }
    while (v14 != v12);
  }
}

- (void)_encodeVertexDescriptorAttributesWithCoder:(id)a3
{
  id v52 = a3;
  uint64_t v6 = objc_msgSend_attributes(self, v4, v5);
  uint64_t v9 = objc_msgSend_count(v6, v7, v8);

  objc_msgSend_encodeInt32_forKey_(v52, v10, v9, @"attributes.count");
  if (v9 << 32)
  {
    uint64_t v11 = 0;
    if ((unint64_t)(int)v9 <= 1) {
      uint64_t v12 = 1;
    }
    else {
      uint64_t v12 = (int)v9;
    }
    do
    {
      id v13 = [NSString alloc];
      id v15 = objc_msgSend_initWithFormat_(v13, v14, @"attributes[%zu]", v11);
      uint64_t v18 = objc_msgSend_attributes(self, v16, v17);
      uint64_t v20 = objc_msgSend_objectAtIndexedSubscript_(v18, v19, v11);

      uint64_t v23 = objc_msgSend_name(v20, v21, v22);
      uint64_t v25 = objc_msgSend_stringByAppendingString_(v15, v24, @".name");
      objc_msgSend_encodeObject_forKey_(v52, v26, (uint64_t)v23, v25);

      uint64_t v29 = objc_msgSend_bufferIndex(v20, v27, v28);
      long long v31 = objc_msgSend_stringByAppendingString_(v15, v30, @".bufferIndex");
      objc_msgSend_encodeInteger_forKey_(v52, v32, v29, v31);

      uint64_t v35 = objc_msgSend_format(v20, v33, v34);
      uint64_t v37 = objc_msgSend_stringByAppendingString_(v15, v36, @".format");
      objc_msgSend_encodeInteger_forKey_(v52, v38, v35, v37);

      uint64_t v41 = objc_msgSend_offset(v20, v39, v40);
      uint64_t v43 = objc_msgSend_stringByAppendingString_(v15, v42, @".offset");
      objc_msgSend_encodeInteger_forKey_(v52, v44, v41, v43);

      objc_msgSend_time(v20, v45, v46);
      double v48 = v47;
      long long v50 = objc_msgSend_stringByAppendingString_(v15, v49, @".time");
      objc_msgSend_encodeDouble_forKey_(v52, v51, (uint64_t)v50, v48);

      ++v11;
    }
    while (v12 != v11);
  }
}

+ (id)_decodeVertexDescriptorAttributesWithCoder:(id)a3
{
  id v3 = a3;
  uint64_t v5 = objc_msgSend_decodeIntegerForKey_(v3, v4, @"attributes.count");
  id v6 = objc_alloc(MEMORY[0x263EFF980]);
  uint64_t v8 = objc_msgSend_initWithCapacity_(v6, v7, v5);
  if (v5)
  {
    for (uint64_t i = 0; i != v5; ++i)
    {
      id v10 = [NSString alloc];
      uint64_t v12 = objc_msgSend_initWithFormat_(v10, v11, @"attributes[%zu]", i);
      id v13 = objc_alloc_init(MDLVertexAttribute);
      uint64_t v14 = objc_opt_class();
      uint64_t v16 = objc_msgSend_stringByAppendingString_(v12, v15, @".name");
      uint64_t v18 = objc_msgSend_decodeObjectOfClass_forKey_(v3, v17, v14, v16);
      objc_msgSend_setName_(v13, v19, (uint64_t)v18);

      uint64_t v21 = objc_msgSend_stringByAppendingString_(v12, v20, @".bufferIndex");
      uint64_t v23 = objc_msgSend_decodeIntegerForKey_(v3, v22, (uint64_t)v21);
      objc_msgSend_setBufferIndex_(v13, v24, v23);

      uint64_t v26 = objc_msgSend_stringByAppendingString_(v12, v25, @".format");
      uint64_t v28 = objc_msgSend_decodeIntegerForKey_(v3, v27, (uint64_t)v26);
      objc_msgSend_setFormat_(v13, v29, v28);

      long long v31 = objc_msgSend_stringByAppendingString_(v12, v30, @".offset");
      uint64_t v33 = objc_msgSend_decodeIntegerForKey_(v3, v32, (uint64_t)v31);
      objc_msgSend_setOffset_(v13, v34, v33);

      uint64_t v36 = objc_msgSend_stringByAppendingString_(v12, v35, @".time");
      objc_msgSend_decodeDoubleForKey_(v3, v37, (uint64_t)v36);
      objc_msgSend_setTime_(v13, v38, v39);

      objc_msgSend_addObject_(v8, v40, (uint64_t)v13);
    }
  }

  return v8;
}

+ (id)_decodeVertexDescriptorLayoutsWithCoder:(id)a3
{
  id v3 = a3;
  uint64_t v5 = objc_msgSend_decodeIntegerForKey_(v3, v4, @"layouts.count");
  id v6 = objc_alloc(MEMORY[0x263EFF980]);
  uint64_t v8 = objc_msgSend_initWithCapacity_(v6, v7, v5);
  if (v5)
  {
    for (uint64_t i = 0; i != v5; ++i)
    {
      id v10 = [NSString alloc];
      uint64_t v12 = objc_msgSend_initWithFormat_(v10, v11, @"layouts[%zu]", i);
      id v13 = objc_alloc_init(MDLVertexBufferLayout);
      id v15 = objc_msgSend_stringByAppendingString_(v12, v14, @".stride");
      uint64_t v17 = objc_msgSend_decodeIntegerForKey_(v3, v16, (uint64_t)v15);
      objc_msgSend_setStride_(v13, v18, v17);

      objc_msgSend_addObject_(v8, v19, (uint64_t)v13);
    }
  }

  return v8;
}

- (void)encodeVertexDescriptorWithCoder:(id)a3
{
  id v6 = a3;
  objc_msgSend__encodeVertexDescriptorAttributesWithCoder_(self, v4, (uint64_t)v6);
  objc_msgSend__encodeVertexDescriptorLayoutsWithCoder_(self, v5, (uint64_t)v6);
}

+ (id)decodeVertexDescriptorWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_alloc_init(MDLVertexDescriptor);
  uint64_t v7 = objc_msgSend__decodeVertexDescriptorAttributesWithCoder_(a1, v6, (uint64_t)v4);
  objc_msgSend_setAttributes_(v5, v8, (uint64_t)v7);

  id v10 = objc_msgSend__decodeVertexDescriptorLayoutsWithCoder_(a1, v9, (uint64_t)v4);
  objc_msgSend_setLayouts_(v5, v11, (uint64_t)v10);

  return v5;
}

- (NSMutableArray)attributes
{
  return self->_attributes;
}

- (void)setAttributes:(NSMutableArray *)attributes
{
}

- (NSMutableArray)layouts
{
  return self->_layouts;
}

- (void)setLayouts:(NSMutableArray *)layouts
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_layouts, 0);

  objc_storeStrong((id *)&self->_attributes, 0);
}

@end