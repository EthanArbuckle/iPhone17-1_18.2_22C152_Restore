@interface CNPropertyListSerialization
+ (id)dataWithObject:(id)a3;
+ (id)dataWithObject:(id)a3 error:(id *)a4;
+ (id)mutableObjectWithData:(id)a3;
+ (id)mutableObjectWithData:(id)a3 error:(id *)a4;
+ (id)objectWithData:(id)a3;
+ (id)objectWithData:(id)a3 error:(id *)a4;
+ (id)objectWithData:(id)a3 options:(unint64_t)a4 error:(id *)a5;
@end

@implementation CNPropertyListSerialization

+ (id)dataWithObject:(id)a3
{
  id v7 = 0;
  v3 = [a1 dataWithObject:a3 error:&v7];
  id v4 = v7;
  v5 = +[CNResult resultWithValue:v3 orError:v4];

  return v5;
}

+ (id)dataWithObject:(id)a3 error:(id *)a4
{
  if (a3)
  {
    v5 = [MEMORY[0x1E4F28F98] dataWithPropertyList:a3 format:200 options:0 error:a4];
  }
  else
  {
    v5 = 0;
  }
  return v5;
}

+ (id)objectWithData:(id)a3
{
  id v7 = 0;
  v3 = [a1 objectWithData:a3 error:&v7];
  id v4 = v7;
  v5 = +[CNResult resultWithValue:v3 orError:v4];

  return v5;
}

+ (id)objectWithData:(id)a3 error:(id *)a4
{
  return (id)[a1 objectWithData:a3 options:0 error:a4];
}

+ (id)mutableObjectWithData:(id)a3
{
  id v7 = 0;
  v3 = [a1 mutableObjectWithData:a3 error:&v7];
  id v4 = v7;
  v5 = +[CNResult resultWithValue:v3 orError:v4];

  return v5;
}

+ (id)mutableObjectWithData:(id)a3 error:(id *)a4
{
  return (id)[a1 objectWithData:a3 options:1 error:a4];
}

+ (id)objectWithData:(id)a3 options:(unint64_t)a4 error:(id *)a5
{
  id v7 = a3;
  v8 = v7;
  if (!v7 || ![v7 length])
  {
    v9 = 0;
    goto LABEL_10;
  }
  id v13 = 0;
  v9 = [MEMORY[0x1E4F28F98] propertyListWithData:v8 options:a4 format:0 error:&v13];
  id v10 = v13;
  if (!v9)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      +[CNPropertyListSerialization objectWithData:options:error:]((uint64_t)v10);
      if (!a5) {
        goto LABEL_9;
      }
    }
    else if (!a5)
    {
      goto LABEL_9;
    }
    *a5 = v10;
    goto LABEL_9;
  }
  id v11 = v9;
LABEL_9:

LABEL_10:

  return v9;
}

+ (void)objectWithData:(uint64_t)a1 options:error:.cold.1(uint64_t a1)
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  int v1 = 138543362;
  uint64_t v2 = a1;
  _os_log_error_impl(&dword_19091D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Error deserializing object: %{public}@", (uint8_t *)&v1, 0xCu);
}

@end