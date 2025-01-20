@interface NSKeyedArchiver(CalClassAdditions)
+ (id)CalArchivedDataWithRootObject:()CalClassAdditions ofClasses:strict:error:;
+ (uint64_t)CalArchivedDataWithRootObject:()CalClassAdditions ofClasses:error:;
@end

@implementation NSKeyedArchiver(CalClassAdditions)

+ (uint64_t)CalArchivedDataWithRootObject:()CalClassAdditions ofClasses:error:
{
  return [a1 CalArchivedDataWithRootObject:a3 ofClasses:a4 strict:0 error:a5];
}

+ (id)CalArchivedDataWithRootObject:()CalClassAdditions ofClasses:strict:error:
{
  v20[5] = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  v11 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:v9 requiringSecureCoding:1 error:a6];
  if (a5)
  {
    v20[0] = 0;
    id v12 = (id)[MEMORY[0x1E4F28DC0] _strictlyUnarchivedObjectOfClasses:v10 fromData:v11 error:v20];
    v13 = (void *)v20[0];
  }
  else
  {
    v19 = 0;
    id v14 = (id)[MEMORY[0x1E4F28DC0] unarchivedObjectOfClasses:v10 fromData:v11 error:&v19];
    v13 = v19;
  }
  id v15 = v13;
  v16 = v15;
  if (a6) {
    *a6 = v15;
  }
  if (v16) {
    id v17 = 0;
  }
  else {
    id v17 = v11;
  }

  return v17;
}

@end