@interface JavaBeansPropertyChangeSupport
+ (const)__metadata;
+ (void)initialize;
- (BOOL)equalsWithNSString:(id)a3 withJavaUtilEventListener:(id)a4 withJavaUtilEventListener:(id)a5;
- (BOOL)hasListenersWithNSString:(id)a3;
- (JavaBeansPropertyChangeSupport)initWithId:(id)a3;
- (id)getPropertyChangeListeners;
- (id)getPropertyChangeListenersWithNSString:(id)a3;
- (void)addPropertyChangeListenerWithJavaBeansPropertyChangeListener:(id)a3;
- (void)addPropertyChangeListenerWithNSString:(id)a3 withJavaBeansPropertyChangeListener:(id)a4;
- (void)dealloc;
- (void)fireIndexedPropertyChangeWithNSString:(id)a3 withInt:(int)a4 withBoolean:(BOOL)a5 withBoolean:(BOOL)a6;
- (void)fireIndexedPropertyChangeWithNSString:(id)a3 withInt:(int)a4 withId:(id)a5 withId:(id)a6;
- (void)fireIndexedPropertyChangeWithNSString:(id)a3 withInt:(int)a4 withInt:(int)a5 withInt:(int)a6;
- (void)firePropertyChangeWithJavaBeansPropertyChangeEvent:(id)a3;
- (void)firePropertyChangeWithNSString:(id)a3 withBoolean:(BOOL)a4 withBoolean:(BOOL)a5;
- (void)firePropertyChangeWithNSString:(id)a3 withId:(id)a4 withId:(id)a5;
- (void)firePropertyChangeWithNSString:(id)a3 withInt:(int)a4 withInt:(int)a5;
- (void)readObjectWithJavaIoObjectInputStream:(id)a3;
- (void)removePropertyChangeListenerWithJavaBeansPropertyChangeListener:(id)a3;
- (void)removePropertyChangeListenerWithNSString:(id)a3 withJavaBeansPropertyChangeListener:(id)a4;
- (void)writeObjectWithJavaIoObjectOutputStream:(id)a3;
@end

@implementation JavaBeansPropertyChangeSupport

- (JavaBeansPropertyChangeSupport)initWithId:(id)a3
{
  return self;
}

- (void)firePropertyChangeWithNSString:(id)a3 withId:(id)a4 withId:(id)a5
{
  v6 = new_JavaBeansPropertyChangeEvent_initWithId_withNSString_withId_withId_(self->sourceBean_, a3, a4, a5);
  [(JavaBeansPropertyChangeSupport *)self firePropertyChangeWithJavaBeansPropertyChangeEvent:v6];
}

- (void)fireIndexedPropertyChangeWithNSString:(id)a3 withInt:(int)a4 withId:(id)a5 withId:(id)a6
{
  v7 = new_JavaBeansIndexedPropertyChangeEvent_initWithId_withNSString_withId_withId_withInt_(self->sourceBean_, a3, a5, a6, a4);
  [(JavaBeansPropertyChangeSupport *)self firePropertyChangeWithJavaBeansPropertyChangeEvent:v7];
}

- (void)removePropertyChangeListenerWithNSString:(id)a3 withJavaBeansPropertyChangeListener:(id)a4
{
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  listeners = self->listeners_;
  if (!listeners) {
    JreThrowNullPointerException();
  }
  id v8 = [(JavaUtilList *)self->listeners_ countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v14;
    while (2)
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v14 != v10) {
          objc_enumerationMutation(listeners);
        }
        v12 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        if (sub_1001D9008(a3, a4, v12))
        {
          -[JavaUtilList removeWithId:](self->listeners_, "removeWithId:", v12, (void)v13);
          return;
        }
      }
      id v9 = [(JavaUtilList *)listeners countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v9) {
        continue;
      }
      break;
    }
  }
}

- (BOOL)equalsWithNSString:(id)a3 withJavaUtilEventListener:(id)a4 withJavaUtilEventListener:(id)a5
{
  return sub_1001D9008(a3, a4, a5);
}

- (void)addPropertyChangeListenerWithNSString:(id)a3 withJavaBeansPropertyChangeListener:(id)a4
{
  if (a3 && a4)
  {
    listeners = self->listeners_;
    if (!listeners) {
      JreThrowNullPointerException();
    }
    v5 = new_JavaBeansPropertyChangeListenerProxy_initWithNSString_withJavaBeansPropertyChangeListener_(a3, a4);
    [(JavaUtilList *)listeners addWithId:v5];
  }
}

- (id)getPropertyChangeListenersWithNSString:(id)a3
{
  v5 = new_JavaUtilArrayList_init();
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  listeners = self->listeners_;
  if (!listeners) {
LABEL_16:
  }
    JreThrowNullPointerException();
  v7 = v5;
  id v8 = [(JavaUtilList *)listeners countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v15;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v15 != v10) {
          objc_enumerationMutation(listeners);
        }
        v12 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          objc_opt_class();
          if (!v12) {
            goto LABEL_16;
          }
          if ((objc_opt_isKindOfClass() & 1) == 0) {
            JreThrowClassCastException();
          }
          if (LibcoreUtilObjects_equalWithId_withId_((uint64_t)a3, (uint64_t)objc_msgSend(v12, "getPropertyName", (void)v14)))-[JavaUtilArrayList addWithId:](v7, "addWithId:", v12); {
        }
          }
      }
      id v9 = [(JavaUtilList *)listeners countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v9);
  }
  return [(JavaUtilArrayList *)v7 toArrayWithNSObjectArray:+[IOSObjectArray arrayWithLength:[(JavaUtilArrayList *)v7 size] type:JavaBeansPropertyChangeListener_class_()]];
}

- (void)firePropertyChangeWithNSString:(id)a3 withBoolean:(BOOL)a4 withBoolean:(BOOL)a5
{
  uint64_t v8 = JavaLangBoolean_valueOfWithBoolean_(a4);
  uint64_t v9 = JavaLangBoolean_valueOfWithBoolean_(a5);
  [(JavaBeansPropertyChangeSupport *)self firePropertyChangeWithNSString:a3 withId:v8 withId:v9];
}

- (void)fireIndexedPropertyChangeWithNSString:(id)a3 withInt:(int)a4 withBoolean:(BOOL)a5 withBoolean:(BOOL)a6
{
  if (a5 != a6)
  {
    BOOL v7 = a6;
    uint64_t v8 = *(void *)&a4;
    uint64_t v11 = JavaLangBoolean_valueOfWithBoolean_(a5);
    uint64_t v12 = JavaLangBoolean_valueOfWithBoolean_(v7);
    [(JavaBeansPropertyChangeSupport *)self fireIndexedPropertyChangeWithNSString:a3 withInt:v8 withId:v11 withId:v12];
  }
}

- (void)firePropertyChangeWithNSString:(id)a3 withInt:(int)a4 withInt:(int)a5
{
  uint64_t v8 = JavaLangInteger_valueOfWithInt_(a4);
  uint64_t v9 = JavaLangInteger_valueOfWithInt_(a5);
  [(JavaBeansPropertyChangeSupport *)self firePropertyChangeWithNSString:a3 withId:v8 withId:v9];
}

- (void)fireIndexedPropertyChangeWithNSString:(id)a3 withInt:(int)a4 withInt:(int)a5 withInt:(int)a6
{
  if (a5 != a6)
  {
    uint64_t v8 = *(void *)&a4;
    uint64_t v11 = JavaLangInteger_valueOfWithInt_(a5);
    uint64_t v12 = JavaLangInteger_valueOfWithInt_(a6);
    [(JavaBeansPropertyChangeSupport *)self fireIndexedPropertyChangeWithNSString:a3 withInt:v8 withId:v11 withId:v12];
  }
}

- (BOOL)hasListenersWithNSString:(id)a3
{
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  listeners = self->listeners_;
  if (!listeners) {
LABEL_17:
  }
    JreThrowNullPointerException();
  id v5 = [(JavaUtilList *)self->listeners_ countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v12;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(listeners);
        }
        uint64_t v9 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0) {
          goto LABEL_14;
        }
        objc_opt_class();
        if (!v9) {
          goto LABEL_17;
        }
        if ((objc_opt_isKindOfClass() & 1) == 0) {
          JreThrowClassCastException();
        }
        if (LibcoreUtilObjects_equalWithId_withId_((uint64_t)a3, (uint64_t)objc_msgSend(v9, "getPropertyName", (void)v11)))
        {
LABEL_14:
          LOBYTE(v5) = 1;
          return (char)v5;
        }
      }
      id v6 = [(JavaUtilList *)listeners countByEnumeratingWithState:&v11 objects:v15 count:16];
      LOBYTE(v5) = 0;
      if (v6) {
        continue;
      }
      break;
    }
  }
  return (char)v5;
}

- (void)removePropertyChangeListenerWithJavaBeansPropertyChangeListener:(id)a3
{
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  listeners = self->listeners_;
  if (!listeners) {
    JreThrowNullPointerException();
  }
  id v6 = [(JavaUtilList *)self->listeners_ countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v12;
    while (2)
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(listeners);
        }
        uint64_t v10 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        if (sub_1001D9008(0, a3, v10))
        {
          -[JavaUtilList removeWithId:](self->listeners_, "removeWithId:", v10, (void)v11);
          return;
        }
      }
      id v7 = [(JavaUtilList *)listeners countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
}

- (void)addPropertyChangeListenerWithJavaBeansPropertyChangeListener:(id)a3
{
  if (a3)
  {
    listeners = self->listeners_;
    if (!listeners) {
      JreThrowNullPointerException();
    }
    -[JavaUtilList addWithId:](listeners, "addWithId:");
  }
}

- (id)getPropertyChangeListeners
{
  listeners = self->listeners_;
  if (!listeners) {
    JreThrowNullPointerException();
  }
  v3 = +[IOSObjectArray arrayWithLength:0 type:JavaBeansPropertyChangeListener_class_()];
  return [(JavaUtilList *)listeners toArrayWithNSObjectArray:v3];
}

- (void)writeObjectWithJavaIoObjectOutputStream:(id)a3
{
  id v5 = new_JavaUtilHashtable_init();
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  listeners = self->listeners_;
  if (!listeners) {
    goto LABEL_32;
  }
  id v7 = v5;
  id v28 = a3;
  id v8 = [(JavaUtilList *)listeners countByEnumeratingWithState:&v33 objects:v38 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v34;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v34 != v10) {
          objc_enumerationMutation(listeners);
        }
        long long v12 = *(void **)(*((void *)&v33 + 1) + 8 * i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0
          && ([(id)JavaIoSerializable_class_() isInstance:v12] & 1) == 0)
        {
          objc_opt_class();
          if (!v12) {
            goto LABEL_32;
          }
          if ((objc_opt_isKindOfClass() & 1) == 0
            || (id v13 = [v12 getListener], v14 = (void *)JavaBeansPropertyChangeListener_class_(), v13)
            && ([v14 isInstance:v13] & 1) == 0)
          {
            JreThrowClassCastException();
          }
          if ([(id)JavaIoSerializable_class_() isInstance:v13])
          {
            long long v15 = -[JavaUtilHashtable getWithId:](v7, "getWithId:", [v12 getPropertyName]);
            if (!v15)
            {
              id sourceBean = self->sourceBean_;
              long long v17 = v7;
              v18 = [JavaBeansPropertyChangeSupport alloc];
              JavaBeansPropertyChangeSupport_initWithId_((uint64_t)v18, sourceBean);
              v19 = v18;
              id v7 = v17;
              long long v15 = v19;
              -[JavaUtilHashtable putWithId:withId:](v17, "putWithId:withId:", [v12 getPropertyName], v15);
              if (!v15) {
                goto LABEL_32;
              }
            }
            [v15[2] addWithId:v13];
          }
        }
      }
      id v9 = [(JavaUtilList *)listeners countByEnumeratingWithState:&v33 objects:v38 count:16];
    }
    while (v9);
  }
  if (!v28 || (id v20 = [v28 putFields]) == 0) {
LABEL_32:
  }
    JreThrowNullPointerException();
  v21 = v20;
  [v20 putWithNSString:@"source" withId:self->sourceBean_];
  [v21 putWithNSString:@"children" withId:v7];
  [v28 writeFields];
  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  v22 = self->listeners_;
  id v23 = [(JavaUtilList *)v22 countByEnumeratingWithState:&v29 objects:v37 count:16];
  if (v23)
  {
    id v24 = v23;
    uint64_t v25 = *(void *)v30;
    do
    {
      for (j = 0; j != v24; j = (char *)j + 1)
      {
        if (*(void *)v30 != v25) {
          objc_enumerationMutation(v22);
        }
        uint64_t v27 = *(void *)(*((void *)&v29 + 1) + 8 * (void)j);
        if ([(id)JavaIoSerializable_class_() isInstance:v27]) {
          [v28 writeObjectWithId:v27];
        }
      }
      id v24 = [(JavaUtilList *)v22 countByEnumeratingWithState:&v29 objects:v37 count:16];
    }
    while (v24);
  }
  [v28 writeObjectWithId:0];
}

- (void)readObjectWithJavaIoObjectInputStream:(id)a3
{
  if (!a3) {
    goto LABEL_26;
  }
  id v5 = [a3 readFields];
  if (!v5) {
    goto LABEL_26;
  }
  id v6 = v5;
  id v25 = a3;
  JreStrongAssign(&self->sourceBean_, [v5 getWithNSString:@"source" withId:0]);
  p_listeners = &self->listeners_;
  id v8 = new_JavaUtilConcurrentCopyOnWriteArrayList_init();
  JreStrongAssignAndConsume((id *)p_listeners, v8);
  id v9 = [v6 getWithNSString:@"children" withId:0];
  uint64_t v10 = (void *)JavaUtilMap_class_();
  if (!v9) {
    goto LABEL_22;
  }
  if (([v10 isInstance:v9] & 1) == 0) {
LABEL_27:
  }
    JreThrowClassCastException();
  long long v34 = 0u;
  long long v35 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  id v11 = [v9 entrySet];
  if (!v11) {
LABEL_26:
  }
    JreThrowNullPointerException();
  id v12 = v11;
  id v13 = [v11 countByEnumeratingWithState:&v32 objects:v37 count:16];
  if (!v13) {
    goto LABEL_22;
  }
  id v14 = v13;
  id obj = v12;
  uint64_t v27 = *(void *)v33;
  do
  {
    for (i = 0; i != v14; i = (char *)i + 1)
    {
      if (*(void *)v33 != v27) {
        objc_enumerationMutation(obj);
      }
      long long v16 = *(void **)(*((void *)&v32 + 1) + 8 * i);
      long long v28 = 0u;
      long long v29 = 0u;
      long long v30 = 0u;
      long long v31 = 0u;
      if (!v16) {
        goto LABEL_26;
      }
      long long v17 = [v16 getValue];
      if (!v17) {
        goto LABEL_26;
      }
      v18 = (void *)v17[2];
      id v19 = [v18 countByEnumeratingWithState:&v28 objects:v36 count:16];
      if (v19)
      {
        id v20 = v19;
        uint64_t v21 = *(void *)v29;
        do
        {
          for (j = 0; j != v20; j = (char *)j + 1)
          {
            if (*(void *)v29 != v21) {
              objc_enumerationMutation(v18);
            }
            -[JavaUtilList addWithId:](*p_listeners, "addWithId:", new_JavaBeansPropertyChangeListenerProxy_initWithNSString_withJavaBeansPropertyChangeListener_([v16 getKey], *(void **)(*((void *)&v28 + 1) + 8 * (void)j)));
          }
          id v20 = [v18 countByEnumeratingWithState:&v28 objects:v36 count:16];
        }
        while (v20);
      }
    }
    id v14 = [obj countByEnumeratingWithState:&v32 objects:v37 count:16];
  }
  while (v14);
LABEL_22:
  while (1)
  {
    id v23 = [v25 readObject];
    id v24 = (void *)JavaBeansPropertyChangeListener_class_();
    if (!v23) {
      break;
    }
    if (([v24 isInstance:v23] & 1) == 0) {
      goto LABEL_27;
    }
    [(JavaUtilList *)*p_listeners addWithId:v23];
  }
}

- (void)firePropertyChangeWithJavaBeansPropertyChangeEvent:(id)a3
{
  if (!a3) {
    goto LABEL_25;
  }
  id v5 = [a3 getPropertyName];
  id v6 = [a3 getOldValue];
  id v7 = [a3 getNewValue];
  if (v7 && v6 && ([v7 isEqual:v6] & 1) != 0) {
    return;
  }
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  listeners = self->listeners_;
  if (!listeners) {
LABEL_25:
  }
    JreThrowNullPointerException();
  id v9 = [(JavaUtilList *)listeners countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v16;
    do
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v16 != v11) {
          objc_enumerationMutation(listeners);
        }
        id v13 = *(id *)(*((void *)&v15 + 1) + 8 * i);
        while (1)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0) {
            break;
          }
          objc_opt_class();
          if (!v13) {
            goto LABEL_25;
          }
          if (objc_opt_isKindOfClass())
          {
            if (!LibcoreUtilObjects_equalWithId_withId_((uint64_t)[v13 getPropertyName], (uint64_t)v5))goto LABEL_21; {
            id v13 = [v13 getListener];
            }
            id v14 = (void *)JavaBeansPropertyChangeListener_class_();
            if (!v13 || ([v14 isInstance:v13] & 1) != 0) {
              continue;
            }
          }
          JreThrowClassCastException();
        }
        if (!v13) {
          goto LABEL_25;
        }
        objc_msgSend(v13, "propertyChangeWithJavaBeansPropertyChangeEvent:", a3, (void)v15);
LABEL_21:
        ;
      }
      id v10 = [(JavaUtilList *)listeners countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v10);
  }
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)JavaBeansPropertyChangeSupport;
  [(JavaBeansPropertyChangeSupport *)&v3 dealloc];
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    v2 = (JavaLangRefWeakReference *)NSObject_class_();
    v6[0] = new_JavaIoObjectStreamField_initWithNSString_withIOSClass_(@"source", v2);
    objc_super v3 = (JavaLangRefWeakReference *)NSObject_class_();
    v4 = +[IOSClass intClass];
    v6[2] = new_JavaIoObjectStreamField_initWithNSString_withIOSClass_(@"propertyChangeSupportSerializedDataVersion", v4);
    id v5 = +[IOSObjectArray newArrayWithObjects:v6 count:3 type:JavaIoObjectStreamField_class_()];
    JreStrongAssignAndConsume(&qword_100560CA0, v5);
    atomic_store(1u, (unsigned __int8 *)&JavaBeansPropertyChangeSupport__initialized);
  }
}

+ (const)__metadata
{
  return (const J2ObjcClassInfo *)&unk_10042EFF0;
}

@end