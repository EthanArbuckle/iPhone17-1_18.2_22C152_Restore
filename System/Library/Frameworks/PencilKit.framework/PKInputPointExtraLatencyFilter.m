@interface PKInputPointExtraLatencyFilter
- (id).cxx_construct;
- (void)addInputPoint:(id *)a3;
@end

@implementation PKInputPointExtraLatencyFilter

- (void)addInputPoint:(id *)a3
{
  if (self)
  {
    ++self->super._numInputPoints;
    unint64_t numFramesExtraLatency = self->_numFramesExtraLatency;
    if (numFramesExtraLatency)
    {
      p_inputPoints = ($F30B99E357B462A7BBD676CBC61D9025 **)&self->_inputPoints;
      begin = self->_inputPoints.__begin_;
      end = self->_inputPoints.__end_;
      unint64_t v9 = (end - begin) >> 7;
      if (v9 > numFramesExtraLatency)
      {
        v10 = ($F30B99E357B462A7BBD676CBC61D9025 *)self->_inputPoints.__begin_;
        do
        {
          int64_t v11 = end - ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)((char *)begin + 128);
          if (end != ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)((char *)begin + 128))
          {
            memmove(begin, (char *)begin + 128, end - ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)((char *)begin + 128));
            v10 = *p_inputPoints;
          }
          end = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)((char *)begin + v11);
          self->_inputPoints.__end_ = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)((char *)begin + v11);
          unint64_t v9 = (($8EF4127CF77ECA3DDB612FCF233DC3A8 *)((char *)begin + v11) - ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)v10) >> 7;
          begin = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)v10;
        }
        while (v9 > self->_numFramesExtraLatency);
        begin = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)v10;
      }
      value = self->_inputPoints.__end_cap_.__value_;
      if (end >= value)
      {
        unint64_t v20 = v9 + 1;
        if ((v9 + 1) >> 57) {
          std::vector<CGPoint>::__throw_length_error[abi:ne180100]();
        }
        uint64_t v21 = value - begin;
        if (v21 >> 6 > v20) {
          unint64_t v20 = v21 >> 6;
        }
        if ((unint64_t)v21 >= 0x7FFFFFFFFFFFFF80) {
          unint64_t v22 = 0x1FFFFFFFFFFFFFFLL;
        }
        else {
          unint64_t v22 = v20;
        }
        if (v22) {
          v23 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<PKInputPoint>>((uint64_t)&self->_inputPoints.__end_cap_, v22);
        }
        else {
          v23 = 0;
        }
        v24 = ($047367E7237D93BB26E796C35D3A0ACE *)&v23[128 * v9];
        v25 = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)&v23[128 * v22];
        $047367E7237D93BB26E796C35D3A0ACE var0 = a3->var0;
        $047367E7237D93BB26E796C35D3A0ACE v27 = *($047367E7237D93BB26E796C35D3A0ACE *)&a3->var1;
        $047367E7237D93BB26E796C35D3A0ACE v28 = *($047367E7237D93BB26E796C35D3A0ACE *)&a3->var5;
        v24[2] = *($047367E7237D93BB26E796C35D3A0ACE *)&a3->var3;
        v24[3] = v28;
        $047367E7237D93BB26E796C35D3A0ACE *v24 = var0;
        v24[1] = v27;
        $047367E7237D93BB26E796C35D3A0ACE v29 = *($047367E7237D93BB26E796C35D3A0ACE *)&a3->var7;
        $047367E7237D93BB26E796C35D3A0ACE v30 = *($047367E7237D93BB26E796C35D3A0ACE *)&a3->var9;
        $047367E7237D93BB26E796C35D3A0ACE v31 = *($047367E7237D93BB26E796C35D3A0ACE *)&a3->var13;
        v24[6] = *($047367E7237D93BB26E796C35D3A0ACE *)&a3->var11;
        v24[7] = v31;
        v24[4] = v29;
        v24[5] = v30;
        v19 = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)&v24[8];
        v33 = *p_inputPoints;
        v32 = self->_inputPoints.__end_;
        if (v32 != ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)*p_inputPoints)
        {
          do
          {
            $047367E7237D93BB26E796C35D3A0ACE v34 = *(($047367E7237D93BB26E796C35D3A0ACE *)v32 - 8);
            $047367E7237D93BB26E796C35D3A0ACE v35 = *(($047367E7237D93BB26E796C35D3A0ACE *)v32 - 7);
            $047367E7237D93BB26E796C35D3A0ACE v36 = *(($047367E7237D93BB26E796C35D3A0ACE *)v32 - 5);
            v24[-6] = *(($047367E7237D93BB26E796C35D3A0ACE *)v32 - 6);
            v24[-5] = v36;
            v24[-8] = v34;
            v24[-7] = v35;
            $047367E7237D93BB26E796C35D3A0ACE v37 = *(($047367E7237D93BB26E796C35D3A0ACE *)v32 - 4);
            $047367E7237D93BB26E796C35D3A0ACE v38 = *(($047367E7237D93BB26E796C35D3A0ACE *)v32 - 3);
            $047367E7237D93BB26E796C35D3A0ACE v39 = *(($047367E7237D93BB26E796C35D3A0ACE *)v32 - 1);
            v24[-2] = *(($047367E7237D93BB26E796C35D3A0ACE *)v32 - 2);
            v24[-1] = v39;
            v24[-4] = v37;
            v24[-3] = v38;
            v24 -= 8;
            v32 = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)((char *)v32 - 128);
          }
          while (v32 != ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)v33);
          v32 = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)*p_inputPoints;
        }
        *p_inputPoints = ($F30B99E357B462A7BBD676CBC61D9025 *)v24;
        self->_inputPoints.__end_ = v19;
        self->_inputPoints.__end_cap_.__value_ = v25;
        if (v32) {
          operator delete(v32);
        }
      }
      else
      {
        $047367E7237D93BB26E796C35D3A0ACE v13 = a3->var0;
        long long v14 = *(_OWORD *)&a3->var1;
        long long v15 = *(_OWORD *)&a3->var5;
        *((_OWORD *)end + 2) = *(_OWORD *)&a3->var3;
        *((_OWORD *)end + 3) = v15;
        *($047367E7237D93BB26E796C35D3A0ACE *)end = v13;
        *((_OWORD *)end + 1) = v14;
        long long v16 = *(_OWORD *)&a3->var7;
        long long v17 = *(_OWORD *)&a3->var9;
        long long v18 = *(_OWORD *)&a3->var13;
        *((_OWORD *)end + 6) = *(_OWORD *)&a3->var11;
        *((_OWORD *)end + 7) = v18;
        *((_OWORD *)end + 4) = v16;
        *((_OWORD *)end + 5) = v17;
        v19 = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)((char *)end + 128);
      }
      self->_inputPoints.__end_ = v19;
      a3 = *p_inputPoints;
    }
    memmove(&self->super._filteredPoint, a3, 0x80uLL);
  }
}

- (void).cxx_destruct
{
  p_inputPoints = &self->_inputPoints;
  begin = self->_inputPoints.__begin_;
  if (begin)
  {
    p_inputPoints->__end_ = begin;
    operator delete(begin);
  }
}

- (id).cxx_construct
{
  *((void *)self + 20) = 0;
  *((void *)self + 21) = 0;
  *((void *)self + 19) = 0;
  return self;
}

@end