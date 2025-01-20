@interface OrgApacheLuceneUtilAutomatonSortedIntSet
- (BOOL)isEqual:(id)a3;
- (OrgApacheLuceneUtilAutomatonSortedIntSet)initWithInt:(int)a3;
- (id)description;
- (id)freezeWithInt:(int)a3;
- (unint64_t)hash;
- (void)computeHash;
- (void)dealloc;
- (void)decrWithInt:(int)a3;
- (void)incrWithInt:(int)a3;
@end

@implementation OrgApacheLuceneUtilAutomatonSortedIntSet

- (OrgApacheLuceneUtilAutomatonSortedIntSet)initWithInt:(int)a3
{
  return self;
}

- (void)incrWithInt:(int)a3
{
  if (self->useTreeMap_)
  {
    v10 = JavaLangInteger_valueOfWithInt_(a3);
    map = self->map_;
    if (map)
    {
      id v12 = [(JavaUtilMap *)map getWithId:v10];
      v13 = self->map_;
      if (v12) {
        int v14 = [v12 intValue] + 1;
      }
      else {
        int v14 = 1;
      }
      v30 = JavaLangInteger_valueOfWithInt_(v14);
      [(JavaUtilMap *)v13 putWithId:v10 withId:v30];
      return;
    }
    goto LABEL_61;
  }
  p_values = &self->values_;
  values = (unsigned int *)self->values_;
  if (!values) {
    goto LABEL_61;
  }
  uint64_t upto = self->upto_;
  if (upto == values[2])
  {
    v18 = OrgApacheLuceneUtilArrayUtil_growWithIntArray_withInt_(values, (int)upto + 1, *(uint64_t *)&a3, v3, v4, v5, v6, v7);
    JreStrongAssign((id *)&self->values_, v18);
    v25 = OrgApacheLuceneUtilArrayUtil_growWithIntArray_withInt_((unsigned int *)self->counts_, self->upto_ + 1, v19, v20, v21, v22, v23, v24);
    JreStrongAssign((id *)&self->counts_, v25);
    uint64_t upto = self->upto_;
  }
  if ((int)upto < 1)
  {
LABEL_23:
    v31 = *p_values;
    if (*p_values)
    {
      uint64_t size = v31->super.size_;
      if ((upto & 0x80000000) != 0 || (int)upto >= (int)size) {
        IOSArray_throwOutOfBoundsWithMsg(size, upto);
      }
      *(&v31->super.size_ + (int)upto + 1) = a3;
      counts = self->counts_;
      if (counts)
      {
        int v34 = self->upto_;
        uint64_t v35 = counts->super.size_;
        if (v34 < 0 || v34 >= (int)v35) {
          IOSArray_throwOutOfBoundsWithMsg(v35, v34);
        }
        *(&counts->super.size_ + v34 + 1) = 1;
        int v36 = self->upto_ + 1;
        self->upto_ = v36;
        if (v36 != 30) {
          return;
        }
        uint64_t v37 = 0;
        self->useTreeMap_ = 1;
        while (1)
        {
          v38 = self->map_;
          if (!v38) {
            break;
          }
          uint64_t v39 = (*p_values)->super.size_;
          if (v37 >= v39) {
            IOSArray_throwOutOfBoundsWithMsg(v39, v37);
          }
          v40 = JavaLangInteger_valueOfWithInt_(*(&(*p_values)->super.size_ + v37 + 1));
          v41 = self->counts_;
          uint64_t v42 = v41->super.size_;
          if (v37 >= v42) {
            IOSArray_throwOutOfBoundsWithMsg(v42, v37);
          }
          [(JavaUtilMap *)v38 putWithId:v40 withId:JavaLangInteger_valueOfWithInt_(*(&v41->super.size_ + ++v37))];
          if (v37 >= self->upto_) {
            return;
          }
        }
      }
    }
    goto LABEL_61;
  }
  uint64_t v26 = 0;
  while (1)
  {
    v27 = *p_values;
    if (!*p_values) {
      goto LABEL_61;
    }
    uint64_t v28 = v27->super.size_;
    if ((int)v26 >= (int)v28) {
      IOSArray_throwOutOfBoundsWithMsg(v28, v26);
    }
    if (*(&v27->super.size_ + v26 + 1) == a3) {
      break;
    }
    uint64_t v29 = (*p_values)->super.size_;
    if ((int)v26 >= (int)v29) {
      IOSArray_throwOutOfBoundsWithMsg(v29, v26);
    }
    if (*(&(*p_values)->super.size_ + v26 + 1) > a3)
    {
      uint64_t v45 = self->upto_;
      if ((int)v45 - 1 >= (int)v26)
      {
        uint64_t v50 = (int)v45 - 1;
        do
        {
          uint64_t v51 = (*p_values)->super.size_;
          if (v50 >= v51) {
            IOSArray_throwOutOfBoundsWithMsg(v51, (v45 - 1));
          }
          if ((v45 & 0x80000000) != 0 || (int)v45 >= (int)v51) {
            IOSArray_throwOutOfBoundsWithMsg(v51, v45);
          }
          *(&(*p_values)->super.size_ + (int)v45 + 1) = *(&(*p_values)->super.size_ + v50 + 1);
          v52 = self->counts_;
          uint64_t v53 = v52->super.size_;
          v54 = v52;
          if (v50 >= v53) {
            IOSArray_throwOutOfBoundsWithMsg(v53, (v45 - 1));
          }
          int v55 = *(&v52->super.size_ + v50 + 1);
          uint64_t v56 = v54->super.size_;
          if ((v45 & 0x80000000) != 0 || (int)v45 >= (int)v56) {
            IOSArray_throwOutOfBoundsWithMsg(v56, v45);
          }
          *(&v54->super.size_ + (int)v45 + 1) = v55;
          uint64_t v45 = (v45 - 1);
        }
        while (v50-- > v26);
      }
      v46 = *p_values;
      uint64_t v47 = v46->super.size_;
      if ((int)v26 >= (int)v47) {
        IOSArray_throwOutOfBoundsWithMsg(v47, v26);
      }
      *(&v46->super.size_ + v26 + 1) = a3;
      v48 = self->counts_;
      if (v48)
      {
        uint64_t v49 = v48->super.size_;
        if ((int)v26 >= (int)v49) {
          IOSArray_throwOutOfBoundsWithMsg(v49, v26);
        }
        *(&v48->super.size_ + v26 + 1) = 1;
        ++self->upto_;
        return;
      }
LABEL_61:
      JreThrowNullPointerException();
    }
    uint64_t upto = self->upto_;
    if ((int)++v26 >= (int)upto) {
      goto LABEL_23;
    }
  }
  v43 = self->counts_;
  if (!v43) {
    goto LABEL_61;
  }
  uint64_t v44 = v43->super.size_;
  if ((int)v26 >= (int)v44) {
    IOSArray_throwOutOfBoundsWithMsg(v44, v26);
  }
  ++*(&v43->super.size_ + v26 + 1);
}

- (void)decrWithInt:(int)a3
{
  if (self->useTreeMap_)
  {
    map = self->map_;
    if (map)
    {
      id v6 = [(JavaUtilMap *)map getWithId:JavaLangInteger_valueOfWithInt_(a3)];
      if (v6)
      {
        unsigned int v7 = [v6 intValue];
        v8 = self->map_;
        v9 = JavaLangInteger_valueOfWithInt_(a3);
        if (v7 == 1) {
          [(JavaUtilMap *)v8 removeWithId:v9];
        }
        else {
          [(JavaUtilMap *)v8 putWithId:v9 withId:JavaLangInteger_valueOfWithInt_(v7 - 1)];
        }
        if (![(JavaUtilMap *)self->map_ size])
        {
          self->useTreeMap_ = 0;
          self->upto_ = 0;
        }
        return;
      }
    }
LABEL_34:
    JreThrowNullPointerException();
  }
  if (self->upto_ < 1) {
    return;
  }
  uint64_t v10 = 0;
  while (1)
  {
    values = self->values_;
    if (!values) {
      goto LABEL_34;
    }
    uint64_t size = values->super.size_;
    if ((int)v10 >= (int)size) {
      IOSArray_throwOutOfBoundsWithMsg(size, v10);
    }
    if (*(&values->super.size_ + v10 + 1) == a3) {
      break;
    }
    if ((int)++v10 >= self->upto_) {
      return;
    }
  }
  counts = self->counts_;
  if (!counts) {
    goto LABEL_34;
  }
  uint64_t v14 = counts->super.size_;
  if ((int)v10 >= (int)v14) {
    IOSArray_throwOutOfBoundsWithMsg(v14, v10);
  }
  --*(&counts->super.size_ + v10 + 1);
  v15 = self->counts_;
  uint64_t v16 = v15->super.size_;
  if ((int)v10 >= (int)v16) {
    IOSArray_throwOutOfBoundsWithMsg(v16, v10);
  }
  if (!*(&v15->super.size_ + v10 + 1))
  {
    int v17 = self->upto_ - 1;
    if ((int)v10 < v17)
    {
      do
      {
        v18 = self->values_;
        uint64_t v19 = v10 + 1;
        uint64_t v20 = v18->super.size_;
        if (v10 + 1 >= (int)v20) {
          IOSArray_throwOutOfBoundsWithMsg(v20, (v10 + 1));
        }
        int v21 = v18->buffer_[v10];
        if (v10 >= (int)v20) {
          IOSArray_throwOutOfBoundsWithMsg(v20, v10);
        }
        *(&self->values_->super.size_ + v10 + 1) = v21;
        uint64_t v22 = self->counts_;
        uint64_t v23 = v22->super.size_;
        if (v19 >= (int)v23) {
          IOSArray_throwOutOfBoundsWithMsg(v23, (v10 + 1));
        }
        int v24 = v22->buffer_[v10];
        if (v10 >= (int)v23) {
          IOSArray_throwOutOfBoundsWithMsg(v23, v10);
        }
        *(&self->counts_->super.size_ + ++v10) = v24;
      }
      while (v17 != v19);
    }
    self->upto_ = v17;
  }
}

- (void)computeHash
{
  if (!self->useTreeMap_)
  {
    int upto = self->upto_;
    self->hashCode_ = upto;
    if (upto < 1) {
      return;
    }
    uint64_t v27 = 0;
    int v28 = upto;
    while (1)
    {
      values = self->values_;
      if (!values) {
        break;
      }
      uint64_t size = values->super.size_;
      if (v27 >= size) {
        IOSArray_throwOutOfBoundsWithMsg(size, v27);
      }
      int v28 = *(&values->super.size_ + v27 + 1) + 683 * v28;
      self->hashCode_ = v28;
      if (++v27 >= upto) {
        return;
      }
    }
LABEL_28:
    JreThrowNullPointerException();
  }
  map = self->map_;
  if (!map) {
    goto LABEL_28;
  }
  signed int v4 = [(JavaUtilMap *)map size];
  uint64_t v5 = self->values_;
  if (!v5) {
    goto LABEL_28;
  }
  if (v4 > v5->super.size_)
  {
    unsigned int v6 = [(JavaUtilMap *)self->map_ size];
    uint64_t v13 = (int)OrgApacheLuceneUtilArrayUtil_oversizeWithInt_withInt_(v6, 4, v7, v8, v9, v10, v11, v12);
    JreStrongAssignAndConsume((id *)&self->values_, +[IOSIntArray newArrayWithLength:v13]);
    JreStrongAssignAndConsume((id *)&self->counts_, +[IOSIntArray newArrayWithLength:v13]);
  }
  self->hashCode_ = [(JavaUtilMap *)self->map_ size];
  self->upto_ = 0;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  id v14 = [(JavaUtilMap *)self->map_ keySet];
  if (!v14) {
    goto LABEL_28;
  }
  v15 = v14;
  id v16 = [v14 countByEnumeratingWithState:&v31 objects:v35 count:16];
  if (v16)
  {
    id v17 = v16;
    uint64_t v18 = *(void *)v32;
    do
    {
      uint64_t v19 = 0;
      do
      {
        if (*(void *)v32 != v18) {
          objc_enumerationMutation(v15);
        }
        uint64_t v20 = *(void **)(*((void *)&v31 + 1) + 8 * (void)v19);
        if (!v20) {
          goto LABEL_28;
        }
        unsigned int v21 = [v20 intValue];
        self->hashCode_ = v21 + 683 * self->hashCode_;
        uint64_t v22 = self->values_;
        int v23 = self->upto_;
        self->upto_ = v23 + 1;
        uint64_t v24 = v22->super.size_;
        if (v23 < 0 || v23 >= (int)v24) {
          IOSArray_throwOutOfBoundsWithMsg(v24, v23);
        }
        *(&v22->super.size_ + v23 + 1) = v21;
        uint64_t v19 = (char *)v19 + 1;
      }
      while (v17 != v19);
      id v25 = [v15 countByEnumeratingWithState:&v31 objects:v35 count:16];
      id v17 = v25;
    }
    while (v25);
  }
}

- (id)freezeWithInt:(int)a3
{
  uint64_t v5 = +[IOSIntArray arrayWithLength:self->upto_];
  JavaLangSystem_arraycopyWithId_withInt_withId_withInt_withInt_(self->values_, 0, v5, 0, self->upto_);
  int hashCode = self->hashCode_;
  uint64_t v7 = [OrgApacheLuceneUtilAutomatonSortedIntSet_FrozenIntSet alloc];
  JreStrongAssign((id *)&v7->values_, v5);
  v7->hashCode_ = hashCode;
  v7->state_ = a3;
  return v7;
}

- (unint64_t)hash
{
  return self->hashCode_;
}

- (BOOL)isEqual:(id)a3
{
  if (!a3) {
    return 0;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    return 0;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    JreThrowClassCastException();
  }
  if (self->hashCode_ != *((_DWORD *)a3 + 4)) {
    return 0;
  }
  uint64_t v5 = *((void *)a3 + 1);
  if (!v5) {
    goto LABEL_20;
  }
  int v6 = *(_DWORD *)(v5 + 8);
  if (v6 != self->upto_) {
    return 0;
  }
  if (v6 >= 1)
  {
    uint64_t v7 = 0;
    while (1)
    {
      uint64_t v8 = *((void *)a3 + 1);
      uint64_t v9 = *(int *)(v8 + 8);
      if (v7 >= v9) {
        IOSArray_throwOutOfBoundsWithMsg(v9, v7);
      }
      values = self->values_;
      if (!values) {
        break;
      }
      int v11 = *(_DWORD *)(v8 + 12 + 4 * v7);
      uint64_t size = values->super.size_;
      if (v7 >= size) {
        IOSArray_throwOutOfBoundsWithMsg(size, v7);
      }
      int v13 = *(&values->super.size_ + v7 + 1);
      BOOL result = v11 == v13;
      if (v11 == v13 && ++v7 < self->upto_) {
        continue;
      }
      return result;
    }
LABEL_20:
    JreThrowNullPointerException();
  }
  return 1;
}

- (id)description
{
  id v3 = [new_JavaLangStringBuilder_init() appendWithChar:91];
  signed int v4 = v3;
  if (self->upto_ >= 1)
  {
    uint64_t v5 = 0;
    while (1)
    {
      if (v5)
      {
        if (!v4) {
          break;
        }
        [v4 appendWithChar:32];
      }
      else if (!v4)
      {
        break;
      }
      values = self->values_;
      if (!values) {
        break;
      }
      uint64_t size = values->super.size_;
      if (v5 >= size) {
        IOSArray_throwOutOfBoundsWithMsg(size, v5);
      }
      id v8 = [v4 appendWithInt:*((unsigned int *)&values->super.size_ + v5 + 1)];
      if (!v8) {
        break;
      }
      id v9 = [v8 appendWithChar:58];
      if (!v9) {
        break;
      }
      counts = self->counts_;
      if (!counts) {
        break;
      }
      int v11 = v9;
      uint64_t v12 = counts->super.size_;
      if (v5 >= v12) {
        IOSArray_throwOutOfBoundsWithMsg(v12, v5);
      }
      [v11 appendWithInt:*((unsigned int *)&counts->super.size_ + ++v5)];
      if (v5 >= self->upto_) {
        goto LABEL_18;
      }
    }
LABEL_21:
    JreThrowNullPointerException();
  }
  if (!v3) {
    goto LABEL_21;
  }
LABEL_18:
  [v4 appendWithChar:93];
  return [v4 description];
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)OrgApacheLuceneUtilAutomatonSortedIntSet;
  [(OrgApacheLuceneUtilAutomatonSortedIntSet *)&v3 dealloc];
}

@end