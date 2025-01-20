@interface HMPerson(HMI)
- (id)createHMIPerson;
- (uint64_t)initWithHMIPerson:()HMI;
@end

@implementation HMPerson(HMI)

- (id)createHMIPerson
{
  id v2 = objc_alloc(MEMORY[0x1E4F69818]);
  v3 = [a1 UUID];
  v4 = [a1 name];
  v5 = (void *)[v2 initWithUUID:v3 name:v4];

  return v5;
}

- (uint64_t)initWithHMIPerson:()HMI
{
  id v4 = a3;
  v5 = [v4 UUID];
  v6 = (void *)[a1 initWithUUID:v5];
  v7 = (void *)[v6 mutableCopy];

  v8 = [v4 name];

  [v7 setName:v8];
  uint64_t v9 = [v7 copy];

  return v9;
}

@end