@interface APSupportedSecureEncodedClass
+ (NSSet)classes;
+ (void)addClasses:(id)a3;
+ (void)initialize;
@end

@implementation APSupportedSecureEncodedClass

+ (void)initialize
{
  v2 = [[APUnfairLock alloc] initWithOptions:1];
  v3 = (void *)qword_1EB789AF0;
  qword_1EB789AF0 = (uint64_t)v2;

  id v4 = objc_alloc(MEMORY[0x1E4F1CAD0]);
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = objc_opt_class();
  uint64_t v8 = objc_opt_class();
  uint64_t v9 = objc_opt_class();
  uint64_t v10 = objc_opt_class();
  uint64_t v11 = objc_opt_class();
  uint64_t v12 = objc_opt_class();
  qword_1EB789B20 = objc_msgSend(v4, "initWithObjects:", v5, v6, v7, v8, v9, v10, v11, v12, objc_opt_class(), 0);
  MEMORY[0x1F41817F8]();
}

+ (NSSet)classes
{
  [(id)qword_1EB789AF0 lock];
  id v2 = (id)qword_1EB789B20;
  [(id)qword_1EB789AF0 unlock];
  return (NSSet *)v2;
}

+ (void)addClasses:(id)a3
{
  v3 = (void *)qword_1EB789AF0;
  id v4 = a3;
  [v3 lock];
  uint64_t v5 = [(id)qword_1EB789B20 setByAddingObjectsFromSet:v4];

  uint64_t v6 = (void *)qword_1EB789B20;
  qword_1EB789B20 = v5;

  uint64_t v7 = (void *)qword_1EB789AF0;
  [v7 unlock];
}

@end