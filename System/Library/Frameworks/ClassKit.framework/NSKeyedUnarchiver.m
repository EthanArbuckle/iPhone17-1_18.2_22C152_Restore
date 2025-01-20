@interface NSKeyedUnarchiver
+ (id)cls_secureUnarchiveObjectOfClass:(Class)a3 withData:(id)a4;
+ (id)cls_secureUnarchiveObjectOfClasses:(id)a3 withData:(id)a4;
@end

@implementation NSKeyedUnarchiver

+ (id)cls_secureUnarchiveObjectOfClass:(Class)a3 withData:(id)a4
{
  if (a3)
  {
    id v6 = a4;
    id v7 = +[NSSet setWithObject:a3];
    v8 = objc_msgSend(a1, "cls_secureUnarchiveObjectOfClasses:withData:", v7, v6);
  }
  else
  {
    id v7 = a4;
    v8 = objc_msgSend(a1, "cls_secureUnarchiveObjectOfClasses:withData:", 0, v7);
  }

  return v8;
}

+ (id)cls_secureUnarchiveObjectOfClasses:(id)a3 withData:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if ([v6 length])
  {
    id v12 = 0;
    id v7 = [objc_alloc((Class)NSKeyedUnarchiver) initForReadingFromData:v6 error:&v12];
    id v8 = v12;
    v9 = v8;
    if (v8)
    {
      objc_msgSend(v8, "cls_debug:", CLSLogDefault);
      v10 = 0;
    }
    else
    {
      v10 = [v7 decodeObjectOfClasses:v5 forKey:NSKeyedArchiveRootObjectKey];
    }
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

@end