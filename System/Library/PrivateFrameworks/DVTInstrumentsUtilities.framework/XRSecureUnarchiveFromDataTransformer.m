@interface XRSecureUnarchiveFromDataTransformer
+ (id)whitelistedClassesForTransforming;
+ (void)addWhitelistedClass:(Class)a3;
- (id)reverseTransformedValue:(id)a3;
- (id)transformedValue:(id)a3;
@end

@implementation XRSecureUnarchiveFromDataTransformer

+ (id)whitelistedClassesForTransforming
{
  os_unfair_lock_lock((os_unfair_lock_t)&unk_2687AA168);
  v2 = (void *)qword_2687AA160;
  if (!qword_2687AA160)
  {
    v3 = (void *)MEMORY[0x263EFFA08];
    uint64_t v4 = objc_opt_class();
    uint64_t v8 = [v3 setWithObjects:v5, v4, v6, v7, nil];
    v9 = (void *)qword_2687AA160;
    qword_2687AA160 = v8;

    v2 = (void *)qword_2687AA160;
  }
  id v10 = v2;
  os_unfair_lock_unlock((os_unfair_lock_t)&unk_2687AA168);

  return v10;
}

+ (void)addWhitelistedClass:(Class)a3
{
  if (a3)
  {
    os_unfair_lock_lock((os_unfair_lock_t)&unk_2687AA168);
    uint64_t v7 = (void *)qword_2687AA160;
    if (!qword_2687AA160)
    {
      uint64_t v8 = (void *)MEMORY[0x263EFFA08];
      uint64_t v9 = objc_opt_class();
      uint64_t v10 = objc_opt_class();
      uint64_t v14 = [v8 setWithObjects:v11, v9, v12, v13, v10, nil];
      v15 = (void *)qword_2687AA160;
      qword_2687AA160 = v14;

      uint64_t v7 = (void *)qword_2687AA160;
    }
    uint64_t v16 = [v7 setByAddingObject:v4, (uint64_t)a3, v5, v6];
    v17 = (void *)qword_2687AA160;
    qword_2687AA160 = v16;

    os_unfair_lock_unlock((os_unfair_lock_t)&unk_2687AA168);
  }
}

- (id)transformedValue:(id)a3
{
  id v3 = a3;
  if (v3 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    uint64_t v8 = (void *)MEMORY[0x263F08928];
    uint64_t v9 = [XRSecureUnarchiveFromDataTransformer whitelistedClassesForTransforming:v4 withOptions:v5 withError:v6 withErrorHandler:v7];
    id v14 = 0;
    v11 = [v8 _unarchiveSecureCodingObjectFromData:v10 ofClasses:v3 withError:v9];
    id v12 = v14;

    if (v12) {
      NSLog(&cfstr_Xrsecureunarch_0.isa, v12);
    }
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (id)reverseTransformedValue:(id)a3
{
  id v3 = a3;
  if ([v3 conformsToProtocol:v4])
  {
    id v13 = 0;
    uint64_t v9 = [MEMORY[0x263F08910] archiveSecureCodingObject:v7 withError:&v13];
    id v10 = v13;
    v11 = v10;
    if (v10) {
      NSLog(&cfstr_Xrsecureunarch_1.isa, v10);
    }
  }
  else
  {
    uint64_t v9 = 0;
  }

  return v9;
}

@end