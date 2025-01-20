@interface PHASEVoxelSet3D
- (PHASEVoxelSet3D)init;
- (PHASEVoxelSet3D)initWithPoints:(void *)a3 count:(unint64_t)a4;
- (double)voxelAtIndex:(unint64_t)a3;
- (id).cxx_construct;
- (int64_t)size;
@end

@implementation PHASEVoxelSet3D

- (PHASEVoxelSet3D)init
{
  v3.receiver = self;
  v3.super_class = (Class)PHASEVoxelSet3D;
  result = [(PHASEVoxelSet3D *)&v3 init];
  result->_size = 0;
  return result;
}

- (PHASEVoxelSet3D)initWithPoints:(void *)a3 count:(unint64_t)a4
{
  v26.receiver = self;
  v26.super_class = (Class)PHASEVoxelSet3D;
  id v6 = [(PHASEVoxelSet3D *)&v26 init];
  v8 = (PHASEVoxelSet3D *)v6;
  v10 = (char *)*((void *)v6 + 1);
  v9 = (char *)*((void *)v6 + 2);
  unint64_t v11 = (v9 - v10) >> 3;
  if (a4 <= v11)
  {
    v20 = (char *)*((void *)v6 + 2);
    if (a4 >= v11) {
      goto LABEL_19;
    }
    v20 = &v10[8 * a4];
    goto LABEL_18;
  }
  unint64_t v12 = a4 - v11;
  uint64_t v13 = *((void *)v6 + 3);
  if (a4 - v11 <= (v13 - (uint64_t)v9) >> 3)
  {
    bzero(*((void **)v6 + 2), 8 * v12);
    v20 = &v9[8 * v12];
LABEL_18:
    *(void *)&v8->_anon_8[8] = v20;
    goto LABEL_19;
  }
  if (a4 >> 61) {
    std::vector<unsigned int>::__throw_length_error[abi:ne180100]();
  }
  uint64_t v14 = v13 - (void)v10;
  unint64_t v15 = v14 >> 2;
  if (v14 >> 2 <= a4) {
    unint64_t v15 = a4;
  }
  if ((unint64_t)v14 >= 0x7FFFFFFFFFFFFFF8) {
    unint64_t v16 = 0x1FFFFFFFFFFFFFFFLL;
  }
  else {
    unint64_t v16 = v15;
  }
  if (v16 >> 61) {
    std::__throw_bad_array_new_length[abi:ne180100]();
  }
  v17 = (char *)operator new(8 * v16);
  v18 = &v17[8 * v11];
  v19 = &v17[8 * v16];
  bzero(v18, 8 * v12);
  v20 = &v18[8 * v12];
  if (v9 != v10)
  {
    do
    {
      uint64_t v21 = *((void *)v9 - 1);
      v9 -= 8;
      HIWORD(v7) = HIWORD(v21);
      *((void *)v18 - 1) = v21;
      v18 -= 8;
    }
    while (v9 != v10);
    v9 = v10;
  }
  *(void *)v8->_anon_8 = v18;
  *(void *)&v8->_anon_8[8] = v20;
  *(void *)&v8->_anon_8[16] = v19;
  if (v9)
  {
    operator delete(v9);
    v20 = *(char **)&v8->_anon_8[8];
  }
LABEL_19:
  uint64_t v22 = (uint64_t)&v20[-*(void *)v8->_anon_8];
  v8->_size = v22 >> 3;
  if (v22)
  {
    unint64_t v23 = 0;
    v24 = (char *)a3 + 4;
    do
    {
      LODWORD(v7) = *((_DWORD *)v24 - 1);
      WORD2(v7) = *v24;
      *(void *)(*(void *)v8->_anon_8 + 8 * v23++) = v7;
      v24 += 3;
    }
    while (v23 < v8->_size);
  }
  return v8;
}

- (double)voxelAtIndex:(unint64_t)a3
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  if ((a3 & 0x8000000000000000) != 0 || (uint64_t v3 = *((void *)a1 + 1), a3 >= (*((void *)a1 + 2) - v3) >> 3))
  {
    v5 = **(id **)(Phase::Logger::GetInstance(a1) + 416);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      int v7 = 136315394;
      v8 = "PHASEGeometryView.mm";
      __int16 v9 = 1024;
      int v10 = 131;
      _os_log_impl(&dword_221E5E000, v5, OS_LOG_TYPE_ERROR, "%25s:%-5d PRECONDITION: index >= 0 && index < _points.size() is false.", (uint8_t *)&v7, 0x12u);
    }
    exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    std::runtime_error::runtime_error(exception, "PRECONDITION: index >= 0 && index < _points.size() is false.");
  }
  return *(double *)(v3 + 8 * a3);
}

- (int64_t)size
{
  return self->_size;
}

- (void).cxx_destruct
{
  uint64_t v3 = *(void **)self->_anon_8;
  if (v3)
  {
    *(void *)&self->_anon_8[8] = v3;
    operator delete(v3);
  }
}

- (id).cxx_construct
{
  *((void *)self + 1) = 0;
  *((void *)self + 2) = 0;
  *((void *)self + 3) = 0;
  return self;
}

@end