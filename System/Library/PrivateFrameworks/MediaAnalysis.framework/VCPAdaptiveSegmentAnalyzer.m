@interface VCPAdaptiveSegmentAnalyzer
- (float)calculateTimestamp:(unint64_t)a3 videoEmbeddings:(id)a4;
- (id).cxx_construct;
- (id)adaptiveEmbeddings;
- (int)calculateAdaptiveSegments:(id)a3 videoEmbeddingsX3D:(id)a4;
- (vector<float,)averagedEmbedding:(VCPAdaptiveSegmentAnalyzer *)self startTime:(SEL)a3 endTime:(id)a4;
@end

@implementation VCPAdaptiveSegmentAnalyzer

- (int)calculateAdaptiveSegments:(id)a3 videoEmbeddingsX3D:(id)a4
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  if ([v11 embeddingType] == 1)
  {
    v6 = [MEMORY[0x1E4F1CA48] array];
    adaptiveEmbeddings = self->_adaptiveEmbeddings;
    self->_adaptiveEmbeddings = v6;

    operator new[]();
  }
  if ((int)MediaAnalysisLogLevel() >= 4)
  {
    v8 = VCPLogInstance();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1BBEDA000, v8, OS_LOG_TYPE_DEFAULT, "Adaptive segments must be calculated on X3D embeddings.", buf, 2u);
    }
  }
  return -18;
}

- (float)calculateTimestamp:(unint64_t)a3 videoEmbeddings:(id)a4
{
  id v5 = a4;
  v6 = [v5 objectAtIndexedSubscript:(unint64_t)(double)(a3 >> 4)];
  CFDictionaryRef v7 = [v6 objectForKeyedSubscript:@"start"];
  CMTimeMakeFromDictionary(&time, v7);
  Float64 Seconds = CMTimeGetSeconds(&time);

  v9 = [v5 objectAtIndexedSubscript:(unint64_t)(double)(a3 >> 4)];
  CFDictionaryRef v10 = [v9 objectForKeyedSubscript:@"duration"];
  CMTimeMakeFromDictionary(&v13, v10);
  float v11 = CMTimeGetSeconds(&v13);

  *(float *)&Float64 Seconds = Seconds;
  return (float)((float)((float)(a3 & 0xF) * v11) * 0.0625) + *(float *)&Seconds;
}

- (vector<float,)averagedEmbedding:(VCPAdaptiveSegmentAnalyzer *)self startTime:(SEL)a3 endTime:(id)a4
{
  uint64_t v75 = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  uint64_t v71 = 0;
  uint64_t v72 = 0;
  uint64_t v73 = 0;
  __p = 0;
  v69 = 0;
  v70 = 0;
  v65 = 0;
  v66 = 0;
  v67 = 0;
  unint64_t v9 = objc_msgSend(v8, "embeddingSize", retstr);
  if (v9 >> 62) {
    size_t v10 = -1;
  }
  else {
    size_t v10 = 4 * v9;
  }
  float v11 = operator new[](v10, MEMORY[0x1E4FBA2D0]);
  memset(v64, 0, sizeof(v64));
  id obj = [v8 embeddingsArray];
  if (![obj countByEnumeratingWithState:v64 objects:v74 count:16])
  {

    if (v11) {
      MEMORY[0x1C186C790](v11, 0x1000C8052888210);
    }
    LODWORD(v61[0]) = 0;
    std::vector<float>::vector(&v58, (v72 - v71) >> 5, v61);
    v42 = (float *)v58;
    if (v72 != v71)
    {
      unint64_t v43 = (v72 - v71) >> 5;
      v44 = (float *)__p;
      v45 = (float *)v65;
      if (v43 <= 1) {
        unint64_t v43 = 1;
      }
      v46 = (float *)v58;
      do
      {
        float v47 = *v44++;
        float v48 = v47;
        if (v47 <= a5) {
          float v48 = a5;
        }
        float v49 = *v45++;
        float v50 = v49;
        if (v49 >= a6) {
          float v50 = a6;
        }
        if (v50 <= v48) {
          float v51 = 0.0;
        }
        else {
          float v51 = v50 - v48;
        }
        *v46++ = v51;
        --v43;
      }
      while (v43);
    }
    if ((float *)v59 != v42)
    {
      unint64_t v52 = (v59 - (uint64_t)v42) >> 2;
      if (v52 <= 1) {
        unint64_t v52 = 1;
      }
      float v53 = 0.0;
      do
      {
        float v54 = *v42++;
        float v53 = v53 + v54;
        --v52;
      }
      while (v52);
    }
    [v8 embeddingSize];
    dlib::matrix<float,0l,0l,dlib::memory_manager_stateless_kernel_1<char>,dlib::row_major_layout>::matrix<dlib::matrix_op<dlib::op_uniform_matrix_3<float>>>(v61);
  }
  v12 = *(void **)v64[1];
  CFDictionaryRef v13 = [*(id *)v64[1] objectForKeyedSubscript:@"start"];
  CMTimeMakeFromDictionary(&time, v13);
  double Seconds = CMTimeGetSeconds(&time);

  CFDictionaryRef v15 = [v12 objectForKeyedSubscript:@"duration"];
  CMTimeMakeFromDictionary(&v62, v15);
  double v16 = CMTimeGetSeconds(&v62);

  float v17 = Seconds;
  v18 = v69;
  if (v69 >= v70)
  {
    v20 = (float *)__p;
    uint64_t v21 = ((char *)v69 - (unsigned char *)__p) >> 2;
    unint64_t v22 = v21 + 1;
    if ((unint64_t)(v21 + 1) >> 62) {
      goto LABEL_58;
    }
    uint64_t v23 = (char *)v70 - (unsigned char *)__p;
    if (((char *)v70 - (unsigned char *)__p) >> 1 > v22) {
      unint64_t v22 = v23 >> 1;
    }
    if ((unint64_t)v23 >= 0x7FFFFFFFFFFFFFFCLL) {
      unint64_t v24 = 0x3FFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v24 = v22;
    }
    if (v24)
    {
      v25 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<float>>((uint64_t)&v70, v24);
      v20 = (float *)__p;
      v18 = v69;
    }
    else
    {
      v25 = 0;
    }
    v26 = (float *)&v25[4 * v21];
    float *v26 = v17;
    v19 = v26 + 1;
    while (v18 != v20)
    {
      int v27 = *((_DWORD *)v18-- - 1);
      *((_DWORD *)v26-- - 1) = v27;
    }
    __p = v26;
    v69 = v19;
    v70 = (float *)&v25[4 * v24];
    if (v20) {
      operator delete(v20);
    }
  }
  else
  {
    float *v69 = v17;
    v19 = v18 + 1;
  }
  float v28 = v16;
  float v29 = v17 + v28;
  v69 = v19;
  v30 = v66;
  if (v66 < v67)
  {
    float *v66 = v29;
    v31 = v30 + 1;
    goto LABEL_37;
  }
  v32 = (float *)v65;
  uint64_t v33 = ((char *)v66 - (unsigned char *)v65) >> 2;
  unint64_t v34 = v33 + 1;
  if (!((unint64_t)(v33 + 1) >> 62))
  {
    uint64_t v35 = (char *)v67 - (unsigned char *)v65;
    if (((char *)v67 - (unsigned char *)v65) >> 1 > v34) {
      unint64_t v34 = v35 >> 1;
    }
    if ((unint64_t)v35 >= 0x7FFFFFFFFFFFFFFCLL) {
      unint64_t v36 = 0x3FFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v36 = v34;
    }
    if (v36)
    {
      v37 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<float>>((uint64_t)&v67, v36);
      v32 = (float *)v65;
      v30 = v66;
    }
    else
    {
      v37 = 0;
    }
    v38 = (float *)&v37[4 * v33];
    float *v38 = v29;
    v31 = v38 + 1;
    while (v30 != v32)
    {
      int v39 = *((_DWORD *)v30-- - 1);
      *((_DWORD *)v38-- - 1) = v39;
    }
    v65 = v38;
    v66 = v31;
    v67 = (float *)&v37[4 * v36];
    if (v32) {
      operator delete(v32);
    }
LABEL_37:
    v66 = v31;
    bzero(v11, 4 * [v8 embeddingSize]);
    v40 = [v12 objectForKeyedSubscript:@"attributes"];
    v41 = [v40 objectForKeyedSubscript:@"embeddings"];
    objc_msgSend(v41, "getBytes:length:", v11, 4 * objc_msgSend(v8, "embeddingSize"));

    v58 = v11;
    uint64_t v59 = 1;
    uint64_t v60 = [v8 embeddingSize];
    dlib::matrix<float,0l,0l,dlib::memory_manager_stateless_kernel_1<char>,dlib::row_major_layout>::matrix<dlib::matrix_op<dlib::op_pointer_to_mat<float>>>(v61);
  }
LABEL_58:
  std::vector<std::unique_ptr<VCPProtoKeypoint>>::__throw_length_error[abi:ne180100]();
}

- (id)adaptiveEmbeddings
{
  return self->_adaptiveEmbeddings;
}

- (void).cxx_destruct
{
  p_featureArray = &self->_featureArray;
  std::vector<dlib::matrix<float,1l,432l,dlib::memory_manager_stateless_kernel_1<char>,dlib::row_major_layout>>::__destroy_vector::operator()[abi:ne180100]((void ***)&p_featureArray);
  objc_storeStrong((id *)&self->_adaptiveEmbeddings, 0);
}

- (id).cxx_construct
{
  *((void *)self + 2) = 0;
  *((void *)self + 3) = 0;
  *((void *)self + 4) = 0;
  return self;
}

@end