@interface HMCRedirectorChange
- (NSSet)deletes;
- (NSSet)inserts;
- (NSSet)updates;
- (NSString)author;
- (NSString)context;
- (id)description;
- (id)descriptionLines;
- (void)dumpForLoggingWithPrefix:(id)a3 logType:(unsigned __int8)a4;
@end

@implementation HMCRedirectorChange

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_author, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_deletes, 0);
  objc_storeStrong((id *)&self->_inserts, 0);
  objc_storeStrong((id *)&self->_updates, 0);
}

- (NSString)author
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (NSString)context
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (NSSet)deletes
{
  return (NSSet *)objc_getProperty(self, a2, 24, 1);
}

- (NSSet)inserts
{
  return (NSSet *)objc_getProperty(self, a2, 16, 1);
}

- (NSSet)updates
{
  return (NSSet *)objc_getProperty(self, a2, 8, 1);
}

- (void)dumpForLoggingWithPrefix:(id)a3 logType:(unsigned __int8)a4
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v6 = a3;
  v7 = [(HMCRedirectorChange *)self descriptionLines];
  v8 = (void *)[v6 mutableCopy];
  v9 = __descriptionHeader(self);
  [v8 appendString:v9];

  if ([v7 count])
  {
    [v8 appendString:@"\n"];
    v10 = [v7 componentsJoinedByString:@"\n"];
    [v8 appendString:v10];
  }
  else
  {
    uint64_t v11 = [v8 appendString:@" (NO CHANGES)"];
  }
  v12 = (void *)MEMORY[0x230FBD990](v11);
  v13 = self;
  v14 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v14, (os_log_type_t)a4))
  {
    v15 = HMFGetLogIdentifier();
    int v16 = 138543618;
    v17 = v15;
    __int16 v18 = 2112;
    v19 = v8;
    _os_log_impl(&dword_22F52A000, v14, (os_log_type_t)a4, "%{public}@%@", (uint8_t *)&v16, 0x16u);
  }
}

- (id)descriptionLines
{
  v3 = [MEMORY[0x263EFF980] array];
  v4 = [(HMCRedirectorChange *)self inserts];
  uint64_t v5 = [v4 count];

  if (v5)
  {
    [v3 addObject:@"inserts:"];
    id v6 = [(HMCRedirectorChange *)self inserts];
    v19[0] = MEMORY[0x263EF8330];
    v19[1] = 3221225472;
    v19[2] = __39__HMCRedirectorChange_descriptionLines__block_invoke;
    v19[3] = &unk_264A2D4B8;
    id v20 = v3;
    objc_msgSend(v6, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v19);
  }
  v7 = [(HMCRedirectorChange *)self updates];
  uint64_t v8 = [v7 count];

  if (v8)
  {
    [v3 addObject:@"updates:"];
    v9 = [(HMCRedirectorChange *)self updates];
    v17[0] = MEMORY[0x263EF8330];
    v17[1] = 3221225472;
    v17[2] = __39__HMCRedirectorChange_descriptionLines__block_invoke_2;
    v17[3] = &unk_264A2D4B8;
    id v18 = v3;
    objc_msgSend(v9, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v17);
  }
  v10 = [(HMCRedirectorChange *)self deletes];
  uint64_t v11 = [v10 count];

  if (v11)
  {
    [v3 addObject:@"deletes:"];
    v12 = [(HMCRedirectorChange *)self deletes];
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = __39__HMCRedirectorChange_descriptionLines__block_invoke_3;
    v15[3] = &unk_264A2D4B8;
    id v16 = v3;
    objc_msgSend(v12, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v15);
  }
  v13 = (void *)[v3 copy];

  return v13;
}

void __39__HMCRedirectorChange_descriptionLines__block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = [a2 description];
  [v2 addObject:v3];
}

void __39__HMCRedirectorChange_descriptionLines__block_invoke_2(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = [a2 description];
  [v2 addObject:v3];
}

void __39__HMCRedirectorChange_descriptionLines__block_invoke_3(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = [a2 description];
  [v2 addObject:v3];
}

- (id)description
{
  id v3 = [(HMCRedirectorChange *)self descriptionLines];
  uint64_t v4 = [v3 count];
  uint64_t v5 = NSString;
  uint64_t v6 = __descriptionHeader(self);
  v7 = (void *)v6;
  if (v4)
  {
    uint64_t v8 = [v3 componentsJoinedByString:@"\n"];
    v9 = [v5 stringWithFormat:@"HMCRedirectorChange %@\n%@>", v7, v8];
  }
  else
  {
    v9 = [v5 stringWithFormat:@"HMCRedirectorChange %@ (NO CHANGES)>", v6];
  }

  return v9;
}

@end