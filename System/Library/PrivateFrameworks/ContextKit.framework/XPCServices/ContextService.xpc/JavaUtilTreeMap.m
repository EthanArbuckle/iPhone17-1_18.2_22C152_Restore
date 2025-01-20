@interface JavaUtilTreeMap
+ (const)__metadata;
+ (int)countWithJavaUtilIterator:(id)a3;
+ (void)initialize;
- (BOOL)containsKeyWithId:(id)a3;
- (BOOL)isEmpty;
- (JavaUtilTreeMap)init;
- (JavaUtilTreeMap)initWithJavaUtilComparator:(id)a3;
- (JavaUtilTreeMap)initWithJavaUtilMap:(id)a3;
- (JavaUtilTreeMap)initWithJavaUtilSortedMap:(id)a3;
- (id)ceilingEntryWithId:(id)a3;
- (id)ceilingKeyWithId:(id)a3;
- (id)clone;
- (id)comparator;
- (id)copyWithZone:(_NSZone *)a3;
- (id)descendingKeySet;
- (id)descendingMap;
- (id)entrySet;
- (id)findByEntryWithJavaUtilMap_Entry:(id)a3;
- (id)findByObjectWithId:(id)a3;
- (id)findWithId:(id)a3 withJavaUtilTreeMap_RelationEnum:(id)a4;
- (id)firstEntry;
- (id)firstKey;
- (id)firstNode;
- (id)floorEntryWithId:(id)a3;
- (id)floorKeyWithId:(id)a3;
- (id)getWithId:(id)a3;
- (id)headMapWithId:(id)a3;
- (id)headMapWithId:(id)a3 withBoolean:(BOOL)a4;
- (id)higherEntryWithId:(id)a3;
- (id)higherKeyWithId:(id)a3;
- (id)immutableCopyWithJavaUtilMap_Entry:(id)a3;
- (id)internalPollFirstEntry;
- (id)internalPollLastEntry;
- (id)keySet;
- (id)lastEntry;
- (id)lastKey;
- (id)lastNode;
- (id)lowerEntryWithId:(id)a3;
- (id)lowerKeyWithId:(id)a3;
- (id)navigableKeySet;
- (id)pollFirstEntry;
- (id)pollLastEntry;
- (id)putInternalWithId:(id)a3 withId:(id)a4;
- (id)removeInternalByKeyWithId:(id)a3;
- (id)removeWithId:(id)a3;
- (id)subMapWithId:(id)a3 withBoolean:(BOOL)a4 withId:(id)a5 withBoolean:(BOOL)a6;
- (id)subMapWithId:(id)a3 withId:(id)a4;
- (id)tailMapWithId:(id)a3;
- (id)tailMapWithId:(id)a3 withBoolean:(BOOL)a4;
- (id)values;
- (int)size;
- (void)clear;
- (void)dealloc;
- (void)readObjectWithJavaIoObjectInputStream:(id)a3;
- (void)rebalanceWithJavaUtilTreeMap_Node:(id)a3 withBoolean:(BOOL)a4;
- (void)removeInternalWithJavaUtilTreeMap_Node:(id)a3;
- (void)replaceInParentWithJavaUtilTreeMap_Node:(id)a3 withJavaUtilTreeMap_Node:(id)a4;
- (void)rotateLeftWithJavaUtilTreeMap_Node:(id)a3;
- (void)rotateRightWithJavaUtilTreeMap_Node:(id)a3;
- (void)writeObjectWithJavaIoObjectOutputStream:(id)a3;
@end

@implementation JavaUtilTreeMap

- (JavaUtilTreeMap)init
{
  return self;
}

- (JavaUtilTreeMap)initWithJavaUtilMap:(id)a3
{
  return self;
}

- (JavaUtilTreeMap)initWithJavaUtilComparator:(id)a3
{
  return self;
}

- (JavaUtilTreeMap)initWithJavaUtilSortedMap:(id)a3
{
  return self;
}

- (id)clone
{
  v7.receiver = self;
  v7.super_class = (Class)JavaUtilTreeMap;
  v3 = [(JavaUtilAbstractMap *)&v7 clone];
  objc_opt_class();
  if (!v3) {
    JreThrowNullPointerException();
  }
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    JreThrowClassCastException();
  }
  root = self->root_;
  if (root) {
    id v5 = [(JavaUtilTreeMap_Node *)root copy__WithJavaUtilTreeMap_Node:0];
  }
  else {
    id v5 = 0;
  }
  JreStrongAssign(v3 + 4, v5);
  JreStrongAssign(v3 + 6, 0);
  JreStrongAssign(v3 + 7, 0);
  JreStrongAssign(v3 + 8, 0);
  return v3;
}

- (int)size
{
  return self->size_;
}

- (BOOL)isEmpty
{
  return self->size_ == 0;
}

- (id)getWithId:(id)a3
{
  id result = [(JavaUtilTreeMap *)self findByObjectWithId:a3];
  if (result)
  {
    return [result getValue];
  }
  return result;
}

- (BOOL)containsKeyWithId:(id)a3
{
  return [(JavaUtilTreeMap *)self findByObjectWithId:a3] != 0;
}

- (void)clear
{
  self->size_ = 0;
  ++self->modCount_;
}

- (id)removeWithId:(id)a3
{
  id result = [(JavaUtilTreeMap *)self removeInternalByKeyWithId:a3];
  if (result) {
    return (id)*((void *)result + 5);
  }
  return result;
}

- (id)putInternalWithId:(id)a3 withId:(id)a4
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&JavaUtilTreeMap_RelationEnum__initialized, memory_order_acquire) & 1) == 0) {
    objc_opt_class();
  }
  objc_super v7 = [(JavaUtilTreeMap *)self findWithId:a3 withJavaUtilTreeMap_RelationEnum:qword_100563EF8];
  if (!v7) {
    JreThrowNullPointerException();
  }
  id v8 = v7[5];
  JreStrongAssign(v7 + 5, a4);
  return v8;
}

- (id)findWithId:(id)a3 withJavaUtilTreeMap_RelationEnum:(id)a4
{
  p_root = (id *)&self->root_;
  comparator = self->comparator_;
  if (self->root_)
  {
    if (comparator == (JavaUtilComparator *)qword_100560D68 && (v11 = (void *)JavaLangComparable_class_(), a3))
    {
      id v9 = a3;
      if (([v11 isInstance:a3] & 1) == 0) {
        JreThrowClassCastException();
      }
    }
    else
    {
      id v9 = 0;
    }
    for (i = (id *)*p_root; ; i = v13)
    {
LABEL_13:
      if (v9)
      {
        if (!i) {
          goto LABEL_44;
        }
        unsigned int v12 = [v9 compareToWithId:i[4]];
        if (!v12) {
          goto LABEL_22;
        }
      }
      else
      {
        v15 = self->comparator_;
        if (!v15 || !i) {
          goto LABEL_44;
        }
        unsigned int v12 = [(JavaUtilComparator *)v15 compareWithId:a3 withId:i[4]];
        if (!v12)
        {
LABEL_22:
          unsigned int v16 = [a4 ordinal];
          if (v16 - 1 < 4) {
            return i;
          }
          if (v16 == 5)
          {
LABEL_29:
            return [i next];
          }
          if (!v16)
          {
LABEL_34:
            return [i prev];
          }
          goto LABEL_25;
        }
      }
      if ((v12 & 0x80000000) != 0)
      {
        v13 = (id *)i[2];
        if (!v13)
        {
          unsigned int v14 = [a4 ordinal];
          switch(v14)
          {
            case 0u:
            case 1u:
              goto LABEL_34;
            case 2u:
              return 0;
            case 3u:
              v20 = i + 2;
              goto LABEL_39;
            case 4u:
            case 5u:
              return i;
            default:
              goto LABEL_13;
          }
        }
        continue;
      }
LABEL_25:
      v13 = (id *)i[3];
      if (!v13)
      {
        unsigned int v17 = [a4 ordinal];
        switch(v17)
        {
          case 0u:
          case 1u:
            return i;
          case 2u:
            return 0;
          case 3u:
            v20 = i + 3;
LABEL_39:
            v21 = new_JavaUtilTreeMap_Node_initWithJavaUtilTreeMap_Node_withId_(i, a3);
            JreStrongAssign(v20, v21);
            ++self->size_;
            ++self->modCount_;
            sub_1001E7258((uint64_t)self, (uint64_t)i, 1);
            return v21;
          case 4u:
          case 5u:
            goto LABEL_29;
          default:
            goto LABEL_13;
        }
      }
    }
  }
  if (comparator == (JavaUtilComparator *)qword_100560D68
    && ([(id)JavaLangComparable_class_() isInstance:a3] & 1) == 0)
  {
    if (a3)
    {
      id v22 = objc_msgSend(objc_msgSend(a3, "getClass"), "getName");
      CFStringRef v30 = JreStrcat("$$", v23, v24, v25, v26, v27, v28, v29, v22);
      v31 = new_JavaLangClassCastException_initWithNSString_((uint64_t)v30);
      objc_exception_throw(v31);
    }
LABEL_44:
    JreThrowNullPointerException();
  }
  if ((atomic_load_explicit((atomic_uchar *volatile)&JavaUtilTreeMap_RelationEnum__initialized, memory_order_acquire) & 1) == 0) {
    objc_opt_class();
  }
  if ((id)qword_100563EF8 != a4) {
    return 0;
  }
  v19 = new_JavaUtilTreeMap_Node_initWithJavaUtilTreeMap_Node_withId_(0, a3);
  JreStrongAssignAndConsume(p_root, v19);
  self->size_ = 1;
  ++self->modCount_;
  return *p_root;
}

- (id)findByObjectWithId:(id)a3
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&JavaUtilTreeMap_RelationEnum__initialized, memory_order_acquire) & 1) == 0) {
    objc_opt_class();
  }
  uint64_t v5 = qword_100563EF0;
  return [(JavaUtilTreeMap *)self findWithId:a3 withJavaUtilTreeMap_RelationEnum:v5];
}

- (id)findByEntryWithJavaUtilMap_Entry:(id)a3
{
  if (!a3) {
    JreThrowNullPointerException();
  }
  id result = -[JavaUtilTreeMap findByObjectWithId:](self, "findByObjectWithId:", [a3 getKey]);
  if (result)
  {
    id v5 = result;
    if (LibcoreUtilObjects_equalWithId_withId_(*((void *)result + 5), (uint64_t)[a3 getValue]))return v5; {
    else
    }
      return 0;
  }
  return result;
}

- (void)removeInternalWithJavaUtilTreeMap_Node:(id)a3
{
  if (!a3) {
    JreThrowNullPointerException();
  }
  id v5 = (void **)((char *)a3 + 16);
  uint64_t v6 = *((void *)a3 + 2);
  objc_super v7 = (void **)((char *)a3 + 24);
  uint64_t v8 = *((void *)a3 + 3);
  id Weak = objc_loadWeak((id *)a3 + 1);
  if (v6) {
    BOOL v10 = v8 == 0;
  }
  else {
    BOOL v10 = 1;
  }
  if (v10)
  {
    uint64_t v11 = (uint64_t)Weak;
    if (v6)
    {
      sub_1001E7648((uint64_t)self, (id *)a3, (id *)v6);
      unsigned int v12 = v5;
    }
    else
    {
      if (!v8)
      {
        sub_1001E7648((uint64_t)self, (id *)a3, 0);
        goto LABEL_17;
      }
      sub_1001E7648((uint64_t)self, (id *)a3, (id *)v8);
      unsigned int v12 = v7;
    }
    JreStrongAssign(v12, 0);
LABEL_17:
    sub_1001E7258((uint64_t)self, v11, 0);
    --self->size_;
    ++self->modCount_;
    return;
  }
  if (*(_DWORD *)(v6 + 48) <= *(_DWORD *)(v8 + 48)) {
    v13 = (id *)[(id)v8 first];
  }
  else {
    v13 = (id *)[(id)v6 last];
  }
  unsigned int v14 = v13;
  [(JavaUtilTreeMap *)self removeInternalWithJavaUtilTreeMap_Node:v13];
  v15 = (id *)*v5;
  if (*v5)
  {
    uint64_t v16 = *((unsigned int *)v15 + 12);
    JreStrongAssign(v14 + 2, *v5);
    objc_storeWeak(v15 + 1, v14);
    JreStrongAssign(v5, 0);
  }
  else
  {
    uint64_t v16 = 0;
  }
  unsigned int v17 = *v7;
  if (*v7)
  {
    int v18 = *((_DWORD *)v17 + 12);
    JreStrongAssign(v14 + 3, *v7);
    objc_storeWeak((id *)v17 + 1, v14);
    JreStrongAssign(v7, 0);
  }
  else
  {
    int v18 = 0;
  }
  *((_DWORD *)v14 + 12) = JavaLangMath_maxWithInt_withInt_(v16, v18) + 1;
  sub_1001E7648((uint64_t)self, (id *)a3, v14);
}

- (id)removeInternalByKeyWithId:(id)a3
{
  id v4 = [(JavaUtilTreeMap *)self findByObjectWithId:a3];
  if (v4) {
    [(JavaUtilTreeMap *)self removeInternalWithJavaUtilTreeMap_Node:v4];
  }
  return v4;
}

- (void)replaceInParentWithJavaUtilTreeMap_Node:(id)a3 withJavaUtilTreeMap_Node:(id)a4
{
}

- (void)rebalanceWithJavaUtilTreeMap_Node:(id)a3 withBoolean:(BOOL)a4
{
}

- (void)rotateLeftWithJavaUtilTreeMap_Node:(id)a3
{
}

- (void)rotateRightWithJavaUtilTreeMap_Node:(id)a3
{
}

- (id)immutableCopyWithJavaUtilMap_Entry:(id)a3
{
  if (!a3) {
    return 0;
  }
  v3 = new_JavaUtilAbstractMap_SimpleImmutableEntry_initWithJavaUtilMap_Entry_(a3);
  return v3;
}

- (id)firstNode
{
  id result = self->root_;
  if (result) {
    return [result first];
  }
  return result;
}

- (id)firstEntry
{
  root = self->root_;
  if (!root) {
    return 0;
  }
  id v3 = [(JavaUtilTreeMap_Node *)root first];
  if (!v3) {
    return 0;
  }
  id v4 = new_JavaUtilAbstractMap_SimpleImmutableEntry_initWithJavaUtilMap_Entry_(v3);
  return v4;
}

- (id)internalPollFirstEntry
{
  root = self->root_;
  if (!root) {
    return 0;
  }
  id v4 = [(JavaUtilTreeMap_Node *)root first];
  [(JavaUtilTreeMap *)self removeInternalWithJavaUtilTreeMap_Node:v4];
  return v4;
}

- (id)pollFirstEntry
{
  root = self->root_;
  if (!root) {
    return 0;
  }
  id v4 = [(JavaUtilTreeMap_Node *)root first];
  [(JavaUtilTreeMap *)self removeInternalWithJavaUtilTreeMap_Node:v4];
  if (!v4) {
    return 0;
  }
  id v5 = new_JavaUtilAbstractMap_SimpleImmutableEntry_initWithJavaUtilMap_Entry_(v4);
  return v5;
}

- (id)firstKey
{
  root = self->root_;
  if (!root)
  {
    id v5 = new_JavaUtilNoSuchElementException_init();
    objc_exception_throw(v5);
  }
  id v3 = [(JavaUtilTreeMap_Node *)root first];
  if (!v3) {
    JreThrowNullPointerException();
  }
  return [v3 getKey];
}

- (id)lastNode
{
  id result = self->root_;
  if (result) {
    return [result last];
  }
  return result;
}

- (id)lastEntry
{
  root = self->root_;
  if (!root) {
    return 0;
  }
  id v3 = [(JavaUtilTreeMap_Node *)root last];
  if (!v3) {
    return 0;
  }
  id v4 = new_JavaUtilAbstractMap_SimpleImmutableEntry_initWithJavaUtilMap_Entry_(v3);
  return v4;
}

- (id)internalPollLastEntry
{
  root = self->root_;
  if (!root) {
    return 0;
  }
  id v4 = [(JavaUtilTreeMap_Node *)root last];
  [(JavaUtilTreeMap *)self removeInternalWithJavaUtilTreeMap_Node:v4];
  return v4;
}

- (id)pollLastEntry
{
  root = self->root_;
  if (!root) {
    return 0;
  }
  id v4 = [(JavaUtilTreeMap_Node *)root last];
  [(JavaUtilTreeMap *)self removeInternalWithJavaUtilTreeMap_Node:v4];
  if (!v4) {
    return 0;
  }
  id v5 = new_JavaUtilAbstractMap_SimpleImmutableEntry_initWithJavaUtilMap_Entry_(v4);
  return v5;
}

- (id)lastKey
{
  root = self->root_;
  if (!root)
  {
    id v5 = new_JavaUtilNoSuchElementException_init();
    objc_exception_throw(v5);
  }
  id v3 = [(JavaUtilTreeMap_Node *)root last];
  if (!v3) {
    JreThrowNullPointerException();
  }
  return [v3 getKey];
}

- (id)lowerEntryWithId:(id)a3
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&JavaUtilTreeMap_RelationEnum__initialized, memory_order_acquire) & 1) == 0) {
    objc_opt_class();
  }
  id result = [(JavaUtilTreeMap *)self findWithId:a3 withJavaUtilTreeMap_RelationEnum:JavaUtilTreeMap_RelationEnum_values_];
  if (result)
  {
    uint64_t v6 = new_JavaUtilAbstractMap_SimpleImmutableEntry_initWithJavaUtilMap_Entry_(result);
    return v6;
  }
  return result;
}

- (id)lowerKeyWithId:(id)a3
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&JavaUtilTreeMap_RelationEnum__initialized, memory_order_acquire) & 1) == 0) {
    objc_opt_class();
  }
  id result = [(JavaUtilTreeMap *)self findWithId:a3 withJavaUtilTreeMap_RelationEnum:JavaUtilTreeMap_RelationEnum_values_];
  if (result)
  {
    return [result getKey];
  }
  return result;
}

- (id)floorEntryWithId:(id)a3
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&JavaUtilTreeMap_RelationEnum__initialized, memory_order_acquire) & 1) == 0) {
    objc_opt_class();
  }
  id result = [(JavaUtilTreeMap *)self findWithId:a3 withJavaUtilTreeMap_RelationEnum:qword_100563EE8];
  if (result)
  {
    uint64_t v6 = new_JavaUtilAbstractMap_SimpleImmutableEntry_initWithJavaUtilMap_Entry_(result);
    return v6;
  }
  return result;
}

- (id)floorKeyWithId:(id)a3
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&JavaUtilTreeMap_RelationEnum__initialized, memory_order_acquire) & 1) == 0) {
    objc_opt_class();
  }
  id result = [(JavaUtilTreeMap *)self findWithId:a3 withJavaUtilTreeMap_RelationEnum:qword_100563EE8];
  if (result)
  {
    return [result getKey];
  }
  return result;
}

- (id)ceilingEntryWithId:(id)a3
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&JavaUtilTreeMap_RelationEnum__initialized, memory_order_acquire) & 1) == 0) {
    objc_opt_class();
  }
  id result = [(JavaUtilTreeMap *)self findWithId:a3 withJavaUtilTreeMap_RelationEnum:qword_100563F00];
  if (result)
  {
    uint64_t v6 = new_JavaUtilAbstractMap_SimpleImmutableEntry_initWithJavaUtilMap_Entry_(result);
    return v6;
  }
  return result;
}

- (id)ceilingKeyWithId:(id)a3
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&JavaUtilTreeMap_RelationEnum__initialized, memory_order_acquire) & 1) == 0) {
    objc_opt_class();
  }
  id result = [(JavaUtilTreeMap *)self findWithId:a3 withJavaUtilTreeMap_RelationEnum:qword_100563F00];
  if (result)
  {
    return [result getKey];
  }
  return result;
}

- (id)higherEntryWithId:(id)a3
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&JavaUtilTreeMap_RelationEnum__initialized, memory_order_acquire) & 1) == 0) {
    objc_opt_class();
  }
  id result = [(JavaUtilTreeMap *)self findWithId:a3 withJavaUtilTreeMap_RelationEnum:qword_100563F08];
  if (result)
  {
    uint64_t v6 = new_JavaUtilAbstractMap_SimpleImmutableEntry_initWithJavaUtilMap_Entry_(result);
    return v6;
  }
  return result;
}

- (id)higherKeyWithId:(id)a3
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&JavaUtilTreeMap_RelationEnum__initialized, memory_order_acquire) & 1) == 0) {
    objc_opt_class();
  }
  id result = [(JavaUtilTreeMap *)self findWithId:a3 withJavaUtilTreeMap_RelationEnum:qword_100563F08];
  if (result)
  {
    return [result getKey];
  }
  return result;
}

- (id)comparator
{
  if (self->comparator_ == (JavaUtilComparator *)qword_100560D68) {
    return 0;
  }
  else {
    return self->comparator_;
  }
}

- (id)entrySet
{
  p_entrySet = &self->entrySet_;
  if (self->entrySet_) {
    return self->entrySet_;
  }
  id v4 = new_JavaUtilTreeMap_EntrySet_initWithJavaUtilTreeMap_(self);
  return JreStrongAssignAndConsume((id *)p_entrySet, v4);
}

- (id)keySet
{
  p_keySet_TreeMap = &self->keySet_TreeMap_;
  if (self->keySet_TreeMap_) {
    return self->keySet_TreeMap_;
  }
  id v4 = new_JavaUtilTreeMap_KeySet_initWithJavaUtilTreeMap_(self);
  return JreStrongAssignAndConsume((id *)p_keySet_TreeMap, v4);
}

- (id)navigableKeySet
{
  p_keySet_TreeMap = &self->keySet_TreeMap_;
  if (self->keySet_TreeMap_) {
    return self->keySet_TreeMap_;
  }
  id v4 = new_JavaUtilTreeMap_KeySet_initWithJavaUtilTreeMap_(self);
  return JreStrongAssignAndConsume((id *)p_keySet_TreeMap, v4);
}

- (id)values
{
  p_valuesCollection_TreeMap = &self->valuesCollection_TreeMap_;
  if (self->valuesCollection_TreeMap_) {
    return self->valuesCollection_TreeMap_;
  }
  id v4 = new_JavaUtilTreeMap_ValuesCollection_initWithJavaUtilTreeMap_(self);
  return JreStrongAssignAndConsume((id *)p_valuesCollection_TreeMap, v4);
}

- (id)subMapWithId:(id)a3 withBoolean:(BOOL)a4 withId:(id)a5 withBoolean:(BOOL)a6
{
  BOOL v6 = a6;
  BOOL v8 = a4;
  if ((atomic_load_explicit(JavaUtilTreeMap_BoundEnum__initialized, memory_order_acquire) & 1) == 0) {
    objc_opt_class();
  }
  uint64_t v11 = JavaUtilTreeMap_BoundEnum_values_;
  uint64_t v12 = qword_100563F18;
  if ((atomic_load_explicit(JavaUtilTreeMap_BoundEnum__initialized, memory_order_acquire) & 1) == 0) {
    objc_opt_class();
  }
  if (v8) {
    v13 = (void *)v11;
  }
  else {
    v13 = (void *)v12;
  }
  unsigned int v14 = &qword_100563F18;
  if (v6) {
    unsigned int v14 = &JavaUtilTreeMap_BoundEnum_values_;
  }
  v15 = (void *)*v14;
  uint64_t v16 = [JavaUtilTreeMap_BoundedMap alloc];
  JavaUtilTreeMap_BoundedMap_initWithJavaUtilTreeMap_withBoolean_withId_withJavaUtilTreeMap_BoundEnum_withId_withJavaUtilTreeMap_BoundEnum_((uint64_t)v16, self, 1, a3, v13, a5, v15);
  return v16;
}

- (id)subMapWithId:(id)a3 withId:(id)a4
{
  if ((atomic_load_explicit(JavaUtilTreeMap_BoundEnum__initialized, memory_order_acquire) & 1) == 0) {
    objc_opt_class();
  }
  objc_super v7 = (void *)JavaUtilTreeMap_BoundEnum_values_;
  if ((atomic_load_explicit(JavaUtilTreeMap_BoundEnum__initialized, memory_order_acquire) & 1) == 0) {
    objc_opt_class();
  }
  BOOL v8 = (void *)qword_100563F18;
  id v9 = [JavaUtilTreeMap_BoundedMap alloc];
  JavaUtilTreeMap_BoundedMap_initWithJavaUtilTreeMap_withBoolean_withId_withJavaUtilTreeMap_BoundEnum_withId_withJavaUtilTreeMap_BoundEnum_((uint64_t)v9, self, 1, a3, v7, a4, v8);
  return v9;
}

- (id)headMapWithId:(id)a3 withBoolean:(BOOL)a4
{
  BOOL v4 = a4;
  if ((atomic_load_explicit(JavaUtilTreeMap_BoundEnum__initialized, memory_order_acquire) & 1) == 0) {
    objc_opt_class();
  }
  uint64_t v7 = JavaUtilTreeMap_BoundEnum_values_;
  uint64_t v8 = qword_100563F18;
  if ((atomic_load_explicit(JavaUtilTreeMap_BoundEnum__initialized, memory_order_acquire) & 1) == 0) {
    objc_opt_class();
  }
  if (v4) {
    id v9 = (void *)v7;
  }
  else {
    id v9 = (void *)v8;
  }
  BOOL v10 = (void *)qword_100563F20;
  uint64_t v11 = [JavaUtilTreeMap_BoundedMap alloc];
  JavaUtilTreeMap_BoundedMap_initWithJavaUtilTreeMap_withBoolean_withId_withJavaUtilTreeMap_BoundEnum_withId_withJavaUtilTreeMap_BoundEnum_((uint64_t)v11, self, 1, 0, v10, a3, v9);
  return v11;
}

- (id)headMapWithId:(id)a3
{
  if ((atomic_load_explicit(JavaUtilTreeMap_BoundEnum__initialized, memory_order_acquire) & 1) == 0) {
    objc_opt_class();
  }
  id v5 = (void *)qword_100563F20;
  if ((atomic_load_explicit(JavaUtilTreeMap_BoundEnum__initialized, memory_order_acquire) & 1) == 0) {
    objc_opt_class();
  }
  BOOL v6 = (void *)qword_100563F18;
  uint64_t v7 = [JavaUtilTreeMap_BoundedMap alloc];
  JavaUtilTreeMap_BoundedMap_initWithJavaUtilTreeMap_withBoolean_withId_withJavaUtilTreeMap_BoundEnum_withId_withJavaUtilTreeMap_BoundEnum_((uint64_t)v7, self, 1, 0, v5, a3, v6);
  return v7;
}

- (id)tailMapWithId:(id)a3 withBoolean:(BOOL)a4
{
  BOOL v4 = a4;
  if ((atomic_load_explicit(JavaUtilTreeMap_BoundEnum__initialized, memory_order_acquire) & 1) == 0) {
    objc_opt_class();
  }
  uint64_t v7 = JavaUtilTreeMap_BoundEnum_values_;
  uint64_t v8 = qword_100563F18;
  if ((atomic_load_explicit(JavaUtilTreeMap_BoundEnum__initialized, memory_order_acquire) & 1) == 0) {
    objc_opt_class();
  }
  if (v4) {
    id v9 = (void *)v7;
  }
  else {
    id v9 = (void *)v8;
  }
  BOOL v10 = (void *)qword_100563F20;
  uint64_t v11 = [JavaUtilTreeMap_BoundedMap alloc];
  JavaUtilTreeMap_BoundedMap_initWithJavaUtilTreeMap_withBoolean_withId_withJavaUtilTreeMap_BoundEnum_withId_withJavaUtilTreeMap_BoundEnum_((uint64_t)v11, self, 1, a3, v9, 0, v10);
  return v11;
}

- (id)tailMapWithId:(id)a3
{
  if ((atomic_load_explicit(JavaUtilTreeMap_BoundEnum__initialized, memory_order_acquire) & 1) == 0) {
    objc_opt_class();
  }
  id v5 = (void *)JavaUtilTreeMap_BoundEnum_values_;
  if ((atomic_load_explicit(JavaUtilTreeMap_BoundEnum__initialized, memory_order_acquire) & 1) == 0) {
    objc_opt_class();
  }
  BOOL v6 = (void *)qword_100563F20;
  uint64_t v7 = [JavaUtilTreeMap_BoundedMap alloc];
  JavaUtilTreeMap_BoundedMap_initWithJavaUtilTreeMap_withBoolean_withId_withJavaUtilTreeMap_BoundEnum_withId_withJavaUtilTreeMap_BoundEnum_((uint64_t)v7, self, 1, a3, v5, 0, v6);
  return v7;
}

- (id)descendingMap
{
  if ((atomic_load_explicit(JavaUtilTreeMap_BoundEnum__initialized, memory_order_acquire) & 1) == 0) {
    objc_opt_class();
  }
  id v3 = (void *)qword_100563F20;
  if ((atomic_load_explicit(JavaUtilTreeMap_BoundEnum__initialized, memory_order_acquire) & 1) == 0) {
    objc_opt_class();
  }
  BOOL v4 = (void *)qword_100563F20;
  id v5 = [JavaUtilTreeMap_BoundedMap alloc];
  JavaUtilTreeMap_BoundedMap_initWithJavaUtilTreeMap_withBoolean_withId_withJavaUtilTreeMap_BoundEnum_withId_withJavaUtilTreeMap_BoundEnum_((uint64_t)v5, self, 0, 0, v3, 0, v4);
  return v5;
}

- (id)descendingKeySet
{
  if ((atomic_load_explicit(JavaUtilTreeMap_BoundEnum__initialized, memory_order_acquire) & 1) == 0) {
    objc_opt_class();
  }
  id v3 = (void *)qword_100563F20;
  if ((atomic_load_explicit(JavaUtilTreeMap_BoundEnum__initialized, memory_order_acquire) & 1) == 0) {
    objc_opt_class();
  }
  BOOL v4 = (void *)qword_100563F20;
  id v5 = [JavaUtilTreeMap_BoundedMap alloc];
  JavaUtilTreeMap_BoundedMap_initWithJavaUtilTreeMap_withBoolean_withId_withJavaUtilTreeMap_BoundEnum_withId_withJavaUtilTreeMap_BoundEnum_((uint64_t)v5, self, 0, 0, v3, 0, v4);
  BOOL v6 = v5;
  return [(JavaUtilTreeMap_BoundedMap *)v6 navigableKeySet];
}

+ (int)countWithJavaUtilIterator:(id)a3
{
  return JavaUtilTreeMap_countWithJavaUtilIterator_(a3);
}

- (void)writeObjectWithJavaIoObjectOutputStream:(id)a3
{
  if (!a3) {
    goto LABEL_13;
  }
  id v5 = [a3 putFields];
  if (!v5) {
    goto LABEL_13;
  }
  objc_msgSend(v5, "putWithNSString:withId:", @"comparator", -[JavaUtilTreeMap comparator](self, "comparator"));
  [a3 writeFields];
  [a3 writeIntWithInt:self->size_];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v6 = [(JavaUtilTreeMap *)self entrySet];
  if (!v6) {
LABEL_13:
  }
    JreThrowNullPointerException();
  uint64_t v7 = v6;
  id v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v14;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v14 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void **)(*((void *)&v13 + 1) + 8 * (void)v11);
        if (!v12) {
          goto LABEL_13;
        }
        objc_msgSend(a3, "writeObjectWithId:", objc_msgSend(*(id *)(*((void *)&v13 + 1) + 8 * (void)v11), "getKey"));
        objc_msgSend(a3, "writeObjectWithId:", objc_msgSend(v12, "getValue"));
        uint64_t v11 = (char *)v11 + 1;
      }
      while (v9 != v11);
      id v9 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v9);
  }
}

- (void)readObjectWithJavaIoObjectInputStream:(id)a3
{
  if (!a3 || (id v5 = [a3 readFields]) == 0) {
    JreThrowNullPointerException();
  }
  id v6 = [v5 getWithNSString:@"comparator" withId:0];
  uint64_t v7 = (void *)JavaUtilComparator_class_();
  if (v6 && ([v7 isInstance:v6] & 1) == 0) {
    goto LABEL_14;
  }
  JreStrongAssign((id *)&self->comparator_, v6);
  if (self->comparator_) {
    goto LABEL_9;
  }
  id v8 = (void *)qword_100560D68;
  id v9 = (void *)JavaUtilComparator_class_();
  if (v8)
  {
    if (([v9 isInstance:v8] & 1) == 0) {
LABEL_14:
    }
      JreThrowClassCastException();
  }
  JreStrongAssign((id *)&self->comparator_, v8);
LABEL_9:
  int v10 = [a3 readInt];
  if (v10 >= 1)
  {
    int v11 = v10;
    do
    {
      -[JavaUtilTreeMap putInternalWithId:withId:](self, "putInternalWithId:withId:", [a3 readObject], objc_msgSend(a3, "readObject"));
      --v11;
    }
    while (v11);
  }
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)JavaUtilTreeMap;
  [(JavaUtilAbstractMap *)&v3 dealloc];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v3 = [(JavaUtilTreeMap *)self clone];
  return v3;
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    JreStrongAssignAndConsume((id *)&qword_100560D68, [JavaUtilTreeMap__1 alloc]);
    atomic_store(1u, (unsigned __int8 *)&JavaUtilTreeMap__initialized);
  }
}

+ (const)__metadata
{
  return (const J2ObjcClassInfo *)&unk_100435BC0;
}

@end