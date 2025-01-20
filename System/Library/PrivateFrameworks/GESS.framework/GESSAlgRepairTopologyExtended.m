@interface GESSAlgRepairTopologyExtended
- (BOOL)run:(id)a3;
- (id)returnVertexReordered;
@end

@implementation GESSAlgRepairTopologyExtended

- (BOOL)run:(id)a3
{
  id v4 = a3;
  [(GESSAlgBase *)self setAlgStatus:1];
  if (([v4 valid] & 1) != 0 && objc_msgSend(v4, "meshType") == 1)
  {
    v5 = (uint64_t *)[v4 meshImpl];
    int v24 = -1;
    std::string::basic_string[abi:ne180100]<0>(__p, "v:repair_output_to_input_mapping");
    cv3d::cv::gess::mesh::MeshProperty::AddAttribute<unsigned int>((uint64_t)v5, &v24, (long long *)__p);
    if (v23 < 0) {
      operator delete(__p[0]);
    }
    if (v5[14] != v5[13])
    {
      unint64_t v8 = 0;
      unsigned int v9 = 0;
      do
      {
        LODWORD(__p[0]) = v24;
        uint64_t v10 = cv3d::cv::gess::mesh::AttributeContainer::attribute<unsigned int>(v5 + 1, (unsigned int *)__p);
        uint64_t v11 = *(void *)(v10 + 40);
        if (v8 >= (*(void *)(v10 + 48) - v11) >> 2) {
          __assert_rtn("operator[]", "Attribute.h", 182, "index < data_.size()");
        }
        *(_DWORD *)(v11 + 4 * v8) = v9++;
        unint64_t v8 = v9;
      }
      while (v9 < (unint64_t)((v5[14] - v5[13]) >> 2));
    }
    char v12 = cv3d::cv::gess::alg::RepairEverything((cv3d::cv::gess::alg *)v5, v6, v7);
    if (v12)
    {
      v13 = (NSMutableData *)[objc_alloc(MEMORY[0x263EFF990]) initWithLength:v5[14] - v5[13]];
      vertexReorderedMappingData = self->_vertexReorderedMappingData;
      self->_vertexReorderedMappingData = v13;

      v15 = [(NSMutableData *)self->_vertexReorderedMappingData mutableBytes];
      if (v5[14] != v5[13])
      {
        v16 = v15;
        unint64_t v17 = 0;
        unsigned int v18 = 1;
        do
        {
          LODWORD(__p[0]) = v24;
          uint64_t v19 = cv3d::cv::gess::mesh::AttributeContainer::attribute<unsigned int>(v5 + 1, (unsigned int *)__p);
          uint64_t v20 = *(void *)(v19 + 40);
          if (v17 >= (*(void *)(v19 + 48) - v20) >> 2) {
            __assert_rtn("operator[]", "Attribute.h", 182, "index < data_.size()");
          }
          v16[v17] = *(_DWORD *)(v20 + 4 * v17);
          unint64_t v17 = v18++;
        }
        while (v17 < (v5[14] - v5[13]) >> 2);
      }
      [(GESSAlgBase *)self setAlgStatus:3];
    }
    else
    {
      [(GESSAlgBase *)self setAlgStatus:2];
    }
  }
  else
  {
    [(GESSAlgBase *)self setAlgStatus:2];
    char v12 = 0;
  }

  return v12;
}

- (id)returnVertexReordered
{
  return self->_vertexReorderedMappingData;
}

- (void).cxx_destruct
{
}

@end