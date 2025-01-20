@interface KVEmbeddedProfileWriter
- (BOOL)addItem:(id)a3 error:(id *)a4;
- (BOOL)finishDataset:(id *)a3;
- (BOOL)finishProfile:(id *)a3;
- (BOOL)startDataset:(id)a3 error:(id *)a4;
- (BOOL)startProfile:(id)a3 error:(id *)a4;
- (KVEmbeddedProfileWriter)initWithOutputStream:(id)a3;
- (id).cxx_construct;
@end

@implementation KVEmbeddedProfileWriter

- (id).cxx_construct
{
  *((void *)self + 4) = 0;
  *((unsigned char *)self + 40) = 0;
  *((_OWORD *)self + 3) = xmmword_1BC3E47D0;
  *((_OWORD *)self + 4) = 0u;
  *((_OWORD *)self + 5) = 0u;
  *((void *)self + 12) = 0;
  *((void *)self + 13) = 1;
  *((_WORD *)self + 56) = 256;
  *(_OWORD *)((char *)self + 120) = 0u;
  *(_OWORD *)((char *)self + 136) = 0u;
  *(_OWORD *)((char *)self + 152) = 0u;
  *((void *)self + 21) = 0;
  return self;
}

- (void).cxx_destruct
{
  begin = self->_items.__begin_;
  if (begin)
  {
    self->_items.__end_ = begin;
    operator delete(begin);
  }
  v4 = self->_datasets.__begin_;
  if (v4)
  {
    self->_datasets.__end_ = v4;
    operator delete(v4);
  }
  sub_1BC3B9370(&self->_fbb.buf_.allocator_);
  objc_storeStrong((id *)&self->_datasetInfo, 0);
  objc_storeStrong((id *)&self->_profileInfo, 0);
  objc_storeStrong((id *)&self->_stream, 0);
}

- (BOOL)finishProfile:(id *)a3
{
  p_fbb = &self->_fbb;
  begin = self->_datasets.__begin_;
  end = self->_datasets.__end_;
  uint64_t v8 = (end - begin) >> 2;
  sub_1BC3BEAD0((uint64_t)&self->_fbb, v8, 4uLL);
  if (end == begin)
  {
    LODWORD(v8) = 0;
  }
  else
  {
    v9 = begin - 4;
    uint64_t v10 = v8;
    do
    {
      uint64_t v11 = v10 - 1;
      int v12 = sub_1BC3B9838(p_fbb, *(_DWORD *)&v9[4 * v10]);
      sub_1BC3B98A8((uint64_t)p_fbb, v12);
      uint64_t v10 = v11;
    }
    while (v11);
  }
  unsigned int v44 = sub_1BC3BEB3C((uint64_t)p_fbb, v8);
  self->_datasets.__end_ = self->_datasets.__begin_;
  v13 = sub_1BC3D8388((unint64_t)p_fbb, self->_profileInfo, &v44, 0);
  uint64_t v19 = objc_msgSend_length(v13, v14, v15, v16, v17, v18);
  stream = self->_stream;
  id v21 = v13;
  uint64_t v27 = objc_msgSend_bytes(v21, v22, v23, v24, v25, v26);
  uint64_t v33 = objc_msgSend_length(v21, v28, v29, v30, v31, v32);
  uint64_t v41 = objc_msgSend_write_maxLength_(stream, v34, v27, v33, v35, v36);
  if (v19 != v41)
  {
    v42 = objc_msgSend_stringWithFormat_(NSString, v37, @"profile: %@", v38, v39, v40, v21);
    sub_1BC3D855C(a3, v42, self->_stream, 1u);
  }
  return v19 == v41;
}

- (BOOL)finishDataset:(id *)a3
{
  objc_msgSend_buffer(self->_datasetInfo, a2, (uint64_t)a3, v3, v4, v5);
  id v7 = objc_claimAutoreleasedReturnValue();
  v13 = (const void *)objc_msgSend_bytes(v7, v8, v9, v10, v11, v12);
  id v14 = v7;
  uint64_t v20 = objc_msgSend_bytes(v14, v15, v16, v17, v18, v19);
  uint64_t v26 = objc_msgSend_length(v14, v21, v22, v23, v24, v25);
  v57 = 0;
  v58 = 0;
  uint64_t v59 = 0;
  sub_1BC3D86E0(&v57, v13, v20 + v26, v20 + v26 - (void)v13);
  uint64_t v27 = v57;
  if (v58 == v57) {
    v28 = &unk_1E9F97028;
  }
  else {
    v28 = v57;
  }
  unsigned int v29 = sub_1BC3D8780((uint64_t *)&self->_fbb, v28, v58 - v57);
  if (v27) {
    operator delete(v27);
  }
  begin = self->_items.__begin_;
  end = self->_items.__end_;
  uint64_t v32 = end - begin;
  if (end == begin) {
    uint64_t v33 = (char *)&unk_1BC3E493C;
  }
  else {
    uint64_t v33 = (char *)self->_items.__begin_;
  }
  uint64_t v34 = v32 >> 2;
  sub_1BC3BEAD0((uint64_t)&self->_fbb, v32 >> 2, 4uLL);
  if (begin == end)
  {
    LODWORD(v34) = 0;
  }
  else
  {
    uint64_t v35 = v33 - 4;
    uint64_t v36 = v34;
    do
    {
      int v37 = sub_1BC3B9838(&self->_fbb, *(_DWORD *)&v35[4 * v36]);
      sub_1BC3B98A8((uint64_t)&self->_fbb, v37);
      --v36;
    }
    while (v36);
  }
  unsigned int v38 = sub_1BC3BEB3C((uint64_t)&self->_fbb, v34);
  self->_items.__end_ = self->_items.__begin_;
  sub_1BC3B8E08((uint64_t)&self->_fbb);
  self->_fbb.nested = 1;
  int reserved = self->_fbb.buf_.reserved_;
  int cur = (int)self->_fbb.buf_.cur_;
  int buf = (int)self->_fbb.buf_.buf_;
  sub_1BC3D87FC(&self->_fbb, v29);
  if (v38)
  {
    int v42 = sub_1BC3B9838(&self->_fbb, v38);
    sub_1BC3B9980((unint64_t)&self->_fbb, 6, v42);
  }
  int v43 = sub_1BC3B8F6C((uint64_t)&self->_fbb, reserved - cur + buf);
  int v44 = v43;
  v46 = (char *)self->_datasets.__end_;
  value = (char *)self->_datasets.__end_cap_.__value_;
  if (v46 >= value)
  {
    v48 = (char *)self->_datasets.__begin_;
    uint64_t v49 = (v46 - v48) >> 2;
    unint64_t v50 = v49 + 1;
    if ((unint64_t)(v49 + 1) >> 62) {
      sub_1BC3BF378();
    }
    uint64_t v51 = value - v48;
    if (v51 >> 1 > v50) {
      unint64_t v50 = v51 >> 1;
    }
    if ((unint64_t)v51 >= 0x7FFFFFFFFFFFFFFCLL) {
      unint64_t v52 = 0x3FFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v52 = v50;
    }
    if (v52)
    {
      if (v52 >> 62) {
        sub_1BC3BF3C8();
      }
      v53 = (char *)operator new(4 * v52);
    }
    else
    {
      v53 = 0;
    }
    v54 = &v53[4 * v49];
    *(_DWORD *)v54 = v44;
    v47 = v54 + 4;
    while (v46 != v48)
    {
      int v55 = *((_DWORD *)v46 - 1);
      v46 -= 4;
      *((_DWORD *)v54 - 1) = v55;
      v54 -= 4;
    }
    self->_datasets.__begin_ = v54;
    self->_datasets.__end_ = v47;
    self->_datasets.__end_cap_.__value_ = &v53[4 * v52];
    if (v48) {
      operator delete(v48);
    }
  }
  else
  {
    *(_DWORD *)v46 = v43;
    v47 = v46 + 4;
  }
  self->_datasets.__end_ = v47;

  return 1;
}

- (BOOL)addItem:(id)a3 error:(id *)a4
{
  id v5 = a3;
  objc_msgSend_buffer(v5, v6, v7, v8, v9, v10);
  id v11 = objc_claimAutoreleasedReturnValue();
  uint64_t v17 = (const void *)objc_msgSend_bytes(v11, v12, v13, v14, v15, v16);
  id v18 = v11;
  uint64_t v24 = objc_msgSend_bytes(v18, v19, v20, v21, v22, v23);
  uint64_t v30 = objc_msgSend_length(v18, v25, v26, v27, v28, v29);
  uint64_t v51 = 0;
  unint64_t v52 = 0;
  uint64_t v53 = 0;
  sub_1BC3D86E0(&v51, v17, v24 + v30, v24 + v30 - (void)v17);
  uint64_t v31 = v51;
  if (v52 == v51) {
    uint64_t v32 = &unk_1E9F97028;
  }
  else {
    uint64_t v32 = v51;
  }
  unsigned int v33 = sub_1BC3D8780((uint64_t *)&self->_fbb, v32, v52 - v51);
  if (v31) {
    operator delete(v31);
  }
  sub_1BC3B8E08((uint64_t)&self->_fbb);
  self->_fbb.nested = 1;
  int buf = self->_fbb.buf_.buf_;
  int cur = self->_fbb.buf_.cur_;
  unint64_t reserved = self->_fbb.buf_.reserved_;
  sub_1BC3D87FC(&self->_fbb, v33);
  int v37 = sub_1BC3B8F6C((uint64_t)&self->_fbb, (int)reserved - (int)cur + (int)buf);
  int v38 = v37;
  end = (char *)self->_items.__end_;
  value = (char *)self->_items.__end_cap_.__value_;
  if (end >= value)
  {
    begin = (char *)self->_items.__begin_;
    uint64_t v43 = (end - begin) >> 2;
    unint64_t v44 = v43 + 1;
    if ((unint64_t)(v43 + 1) >> 62) {
      sub_1BC3BF378();
    }
    uint64_t v45 = value - begin;
    if (v45 >> 1 > v44) {
      unint64_t v44 = v45 >> 1;
    }
    if ((unint64_t)v45 >= 0x7FFFFFFFFFFFFFFCLL) {
      unint64_t v46 = 0x3FFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v46 = v44;
    }
    if (v46)
    {
      if (v46 >> 62) {
        sub_1BC3BF3C8();
      }
      v47 = (char *)operator new(4 * v46);
    }
    else
    {
      v47 = 0;
    }
    v48 = &v47[4 * v43];
    *(_DWORD *)v48 = v38;
    uint64_t v41 = v48 + 4;
    while (end != begin)
    {
      int v49 = *((_DWORD *)end - 1);
      end -= 4;
      *((_DWORD *)v48 - 1) = v49;
      v48 -= 4;
    }
    self->_items.__begin_ = v48;
    self->_items.__end_ = v41;
    self->_items.__end_cap_.__value_ = &v47[4 * v46];
    if (begin) {
      operator delete(begin);
    }
  }
  else
  {
    *(_DWORD *)end = v37;
    uint64_t v41 = end + 4;
  }
  self->_items.__end_ = v41;

  return 1;
}

- (BOOL)startDataset:(id)a3 error:(id *)a4
{
  return 1;
}

- (BOOL)startProfile:(id)a3 error:(id *)a4
{
  return 1;
}

- (KVEmbeddedProfileWriter)initWithOutputStream:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)KVEmbeddedProfileWriter;
  v6 = [(KVEmbeddedProfileWriter *)&v9 init];
  uint64_t v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_stream, a3);
  }

  return v7;
}

@end