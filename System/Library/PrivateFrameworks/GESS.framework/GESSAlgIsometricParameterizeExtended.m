@interface GESSAlgIsometricParameterizeExtended
- (BOOL)run:(id)a3;
- (BOOL)setFaceIntensity:(float *)a3 size:(unint64_t)a4;
- (id).cxx_construct;
- (id)returnReport;
- (void)setOptions:(id)a3;
@end

@implementation GESSAlgIsometricParameterizeExtended

- (BOOL)setFaceIntensity:(float *)a3 size:(unint64_t)a4
{
  v5 = (NSData *)[objc_alloc(MEMORY[0x263EFF8F8]) initWithBytesNoCopy:a3 length:a4 freeWhenDone:0];
  faceIntensityData = self->_faceIntensityData;
  self->_faceIntensityData = v5;

  return 1;
}

- (void)setOptions:(id)a3
{
}

- (BOOL)run:(id)a3
{
  v41[4] = *MEMORY[0x263EF8340];
  id v4 = a3;
  [(GESSAlgBase *)self setAlgStatus:1];
  if (([v4 valid] & 1) != 0 && objc_msgSend(v4, "meshType") == 1)
  {
    uint64_t v5 = [v4 meshImpl];
    options = self->_options;
    if (!options)
    {
      v7 = objc_alloc_init(GESSAlgIsometricParameterizeOptions);
      v8 = self->_options;
      self->_options = v7;

      options = self->_options;
    }
    uint64_t v27 = 10;
    int v28 = 1036831949;
    BOOL v29 = 0;
    unsigned int v30 = 100000;
    BOOL v31 = 0;
    __int16 v37 = 256;
    if ([(GESSAlgParameterizeOptions *)options packingMethod] == 1) {
      int v9 = 2;
    }
    else {
      int v9 = 1;
    }
    int v34 = v9;
    int v35 = 2 * ([(GESSAlgParameterizeOptions *)self->_options overlapCheckMode] == 1);
    BOOL v36 = [(GESSAlgParameterizeOptions *)self->_options enableUVUtilizationOptimization];
    unsigned int v32 = [(GESSAlgParameterizeOptions *)self->_options textureResolution];
    char v33 = [(GESSAlgParameterizeOptions *)self->_options numOfTextures];
    [(GESSAlgParameterizeOptions *)self->_options gutter];
    int v38 = v10;
    uint64_t v27 = [(GESSAlgIsometricParameterizeOptions *)self->_options targetNumOfCharts];
    [(GESSAlgIsometricParameterizeOptions *)self->_options maximumStretchRatio];
    int v28 = v11;
    HIBYTE(v37) = [(GESSAlgIsometricParameterizeOptions *)self->_options enableParallel];
    BOOL v29 = [(GESSAlgIsometricParameterizeOptions *)self->_options skipInitialStretchOptimization];
    unsigned int v30 = [(GESSAlgIsometricParameterizeOptions *)self->_options optimizeBoundaryIfFaceNumberLessThan];
    BOOL v31 = [(GESSAlgIsometricParameterizeOptions *)self->_options repairUVSelfIntersection];
    faceIntensityData = self->_faceIntensityData;
    if (faceIntensityData)
    {
      uint64_t v13 = [(NSData *)faceIntensityData bytes];
      std::string::basic_string[abi:ne180100]<0>(__p, "f:imt");
      v39[0] = 0;
      v39[1] = 0;
      int v14 = cv3d::cv::gess::mesh::AttributeContainer::handle<cv3d::cv::gess::math::Vector3T<float>>((uint64_t **)(v5 + 56), (uint64_t)v39, (unsigned __int8 *)__p);
      int v26 = v14;
      if (v25 < 0) {
        operator delete(__p[0]);
      }
      if (v14 == -1)
      {
        std::string::basic_string[abi:ne180100]<0>(__p, "f:imt");
        cv3d::cv::gess::mesh::MeshProperty::AddAttribute<cv3d::cv::gess::math::Vector3T<float>>(v5, &v26, (long long *)__p);
        if (v25 < 0) {
          operator delete(__p[0]);
        }
      }
      if (*(void *)(v5 + 112) != *(void *)(v5 + 104))
      {
        unint64_t v16 = 0;
        unsigned int v17 = 1;
        do
        {
          LODWORD(v15) = *(_DWORD *)(v13 + 4 * v16);
          long long v23 = v15;
          LODWORD(__p[0]) = v26;
          uint64_t v18 = cv3d::cv::gess::mesh::AttributeContainer::attribute<cv3d::cv::gess::math::Vector3T<float>>((uint64_t *)(v5 + 56), (unsigned int *)__p);
          uint64_t v19 = *(void *)(v18 + 40);
          if (v16 >= (*(void *)(v18 + 48) - v19) >> 4) {
            __assert_rtn("operator[]", "Attribute.h", 182, "index < data_.size()");
          }
          *(void *)&long long v15 = v23;
          *((void *)&v15 + 1) = v23;
          *(_OWORD *)(v19 + 16 * v16) = v15;
          unint64_t v16 = v17++;
        }
        while (v16 < (uint64_t)(*(void *)(v5 + 112) - *(void *)(v5 + 104)) >> 2);
      }
      LOBYTE(v37) = 1;
    }
    else
    {
      LOBYTE(v37) = 0;
    }
    self->_report.needs_report = 1;
    v41[3] = 0;
    v40[3] = 0;
    BOOL v20 = cv3d::cv::gess::alg::IsoChartParameterize(v5, (uint64_t)&v27, (uint64_t)&self->_report, (uint64_t)v41, (uint64_t)v40);
    std::__function::__value_func<void ()(std::string const&)>::~__value_func[abi:ne180100](v40);
    std::__function::__value_func<BOOL ()(void)>::~__value_func[abi:ne180100](v41);
    if (v20) {
      uint64_t v21 = 3;
    }
    else {
      uint64_t v21 = 2;
    }
    -[GESSAlgBase setAlgStatus:](self, "setAlgStatus:", v21, v23);
  }
  else
  {
    LOBYTE(v20) = 0;
  }

  return v20;
}

- (id)returnReport
{
  v3 = objc_alloc_init(GESSAlgIsometricParameterizeReport);
  if ([(GESSAlgBase *)self algStatus] && [(GESSAlgBase *)self algStatus] != 1)
  {
    [(GESSAlgReport *)v3 setSuccess:[(GESSAlgBase *)self algStatus] == 3];
    p_report = &self->_report;
    [(GESSAlgIsometricParameterizeReport *)v3 setChartingTime:p_report->chart_time.__rep_];
    [(GESSAlgIsometricParameterizeReport *)v3 setInitialParameterizationTime:p_report->initial_param_time.__rep_];
    [(GESSAlgIsometricParameterizeReport *)v3 setSplitParameterizationTime:p_report->split_param_time.__rep_];
    [(GESSAlgIsometricParameterizeReport *)v3 setChartMergingTime:p_report->chart_merge_time.__rep_];
    [(GESSAlgIsometricParameterizeReport *)v3 setFixSelfIntersectionTime:p_report->fix_self_intersect_time.__rep_];
    [(GESSAlgIsometricParameterizeReport *)v3 setPackingTime:p_report->pack_time.__rep_];
    [(GESSAlgIsometricParameterizeReport *)v3 setNumOfCharts:LODWORD(p_report->chart_number)];
    [(GESSAlgIsometricParameterizeReport *)v3 setNumOfPackedTextures:LODWORD(p_report->pack_img_number)];
    *(float *)&double v5 = p_report->max_stretch_ratio;
    [(GESSAlgIsometricParameterizeReport *)v3 setMaximumStretchRatio:v5];
    *(float *)&double v6 = p_report->avg_stretch_ratio;
    [(GESSAlgIsometricParameterizeReport *)v3 setAverageStretchRatio:v6];
    *(float *)&double v7 = p_report->self_intersect_ratio;
    [(GESSAlgIsometricParameterizeReport *)v3 setSelfIntersectionRatio:v7];
    unsigned int param_status = p_report->param_status;
    if (param_status >= 4) {
      uint64_t v9 = 4;
    }
    else {
      uint64_t v9 = param_status;
    }
    [(GESSAlgIsometricParameterizeReport *)v3 setParameterizeStatus:v9];
  }

  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_faceIntensityData, 0);

  objc_storeStrong((id *)&self->_options, 0);
}

- (id).cxx_construct
{
  *((_OWORD *)self + 3) = 0u;
  *((_OWORD *)self + 4) = 0u;
  *((_OWORD *)self + 5) = 0u;
  *((_OWORD *)self + 6) = 0u;
  *(_OWORD *)((char *)self + 108) = 0u;
  *((_DWORD *)self + 31) = 3;
  *((unsigned char *)self + 128) = 1;
  return self;
}

@end