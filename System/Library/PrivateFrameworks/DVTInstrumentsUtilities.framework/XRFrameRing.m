@interface XRFrameRing
- (XRFrameRing)init;
- (XRFrameRing)initWithMinorFrameCount:(unsigned __int8)a3;
- (id).cxx_construct;
- (shared_ptr<xray::scheduler::Ring>)_parent;
- (void)_moveToCommutator:(void *)a3;
- (void)_removeFromCommutator:(void *)a3;
- (void)assignActivityManager:(id)a3 frame:(id)a4;
- (void)assignActivityManager:(id)a3 slot:(unsigned __int8)a4;
@end

@implementation XRFrameRing

- (XRFrameRing)initWithMinorFrameCount:(unsigned __int8)a3
{
  unsigned __int8 v21 = a3;
  v20.receiver = self;
  v20.super_class = (Class)XRFrameRing;
  v3 = [(XRFrameRing *)&v20 init];
  if (v3)
  {
    sub_2345788B0(&v21, &v19);
    long long v4 = v19;
    long long v19 = 0uLL;
    v5 = (std::__shared_weak_count *)*((void *)v3 + 2);
    *(_OWORD *)(v3 + 8) = v4;
    if (v5)
    {
      sub_234578B24(v5);
      if (*((void *)&v19 + 1)) {
        sub_234578B24(*((std::__shared_weak_count **)&v19 + 1));
      }
    }
    *((void *)v3 + 3) = **((void **)v3 + 1);
    id v6 = objc_alloc(MEMORY[0x263EFF980]);
    uint64_t v10 = [v6 initWithCapacity:v7 capacity:v21 capacity:v8 capacity:v9 capacity:v19];
    v11 = (void *)*((void *)v3 + 4);
    *((void *)v3 + 4) = v10;

    if (v21)
    {
      for (unsigned int i = 0; i < v21; ++i)
      {
        v13 = (void *)*((void *)v3 + 4);
        v14 = objc_opt_new();
        [v13 addObject:(id)v14];
      }
    }
  }
  return (XRFrameRing *)v3;
}

- (XRFrameRing)init
{
  return (XRFrameRing *)((uint64_t (*)(XRFrameRing *, char *, uint64_t))MEMORY[0x270F9A6D0])(self, sel_initWithMinorFrameCount_, 8);
}

- (void)assignActivityManager:(id)a3 frame:(id)a4
{
  id v6 = a3;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = sub_234578384;
  v11[3] = &unk_264BF0BB0;
  v11[4] = self;
  id v12 = v6;
  id v7 = v6;
  [a4 enumerateIndexesUsingBlock:v8, v11, v9, v10];
}

- (void)assignActivityManager:(id)a3 slot:(unsigned __int8)a4
{
  unsigned int v4 = a4;
  uint64_t v16 = (char *)a3;
  if (!self->_ringImpl.__ptr_) {
    [MEMORY[0x263EFF940] raiseFormat:@"Manager %@ attempting to be assigned to a ring that has already been added to a commutator." arguments:v8, v16];
  }
  uint64_t v9 = [self->_managersBySlot objectAtIndexedSubscript:v6];
  if ([v9 containsObject:v10 withOptions:(NSMatchingOptions)v16 range:v11] == YES) {
    [MEMORY[0x263EFF940] raiseFormat:@"Manager %@ added twice to the same slot." arguments:v15, v16];
  }
  else {
    [v9 addObject:v13];
  }
}

- (void)_moveToCommutator:(void *)a3
{
  managersBySlot = self->_managersBySlot;
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = sub_234578578;
  v13[3] = &unk_264BF0BD8;
  v13[4] = self;
  [managersBySlot enumerateObjectsUsingBlock:a2, v3, v4];
  uint64_t v8 = self->_managersBySlot;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = sub_2345786D4;
  v12[3] = &unk_264BF0BD8;
  v12[4] = self;
  [v8 enumerateObjectsUsingBlock:v9, v12, v10, v11];
  sub_234598344((uint64_t)a3, &self->_ringImpl.__ptr_);
}

- (void)_removeFromCommutator:(void *)a3
{
}

- (shared_ptr<xray::scheduler::Ring>)_parent
{
  cntrl = self->_ringImpl.__cntrl_;
  *v2 = self->_ringImpl.__ptr_;
  v2[1] = (Ring *)cntrl;
  if (cntrl) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)cntrl + 1, 1uLL, memory_order_relaxed);
  }
  result.__cntrl_ = (__shared_weak_count *)a2;
  result.__ptr_ = (Ring *)self;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_managersBySlot, 0);
  cntrl = self->_ringImpl.__cntrl_;
  if (cntrl)
  {
    sub_234578B24((std::__shared_weak_count *)cntrl);
  }
}

- (id).cxx_construct
{
  *((void *)self + 1) = 0;
  *((void *)self + 2) = 0;
  return self;
}

@end