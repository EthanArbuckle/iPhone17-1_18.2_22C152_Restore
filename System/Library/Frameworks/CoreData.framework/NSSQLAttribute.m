@interface NSSQLAttribute
- (BOOL)isFileBackedFuture;
- (NSSQLAttribute)initWithEntity:(id)a3 propertyDescription:(id)a4;
- (id)initForReadOnlyFetchWithExpression:(id)a3;
- (uint64_t)_sqlTypeForAttributeType:(uint64_t)a1 flags:(uint64_t)a2;
- (void)addKeyForTriggerOnRelationship:(id)object;
- (void)dealloc;
@end

@implementation NSSQLAttribute

- (id)initForReadOnlyFetchWithExpression:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)NSSQLAttribute;
  v4 = [(NSSQLColumn *)&v7 initForReadOnlyFetching];
  v5 = v4;
  if (v4)
  {
    v4[24] = 1;
    v4[25] = -[NSSQLAttribute _sqlTypeForAttributeType:flags:]([a3 expressionResultType], 0);
    *((void *)v5 + 1) = a3;
    *((_WORD *)v5 + 16) &= 0xFFF6u;
  }
  return v5;
}

- (NSSQLAttribute)initWithEntity:(id)a3 propertyDescription:(id)a4
{
  v12.receiver = self;
  v12.super_class = (Class)NSSQLAttribute;
  v6 = -[NSSQLColumn initWithEntity:propertyDescription:](&v12, sel_initWithEntity_propertyDescription_);
  objc_super v7 = v6;
  if (v6)
  {
    v6->super.super._propertyType = 1;
    v6->super.super._sqlType = -[NSSQLAttribute _sqlTypeForAttributeType:flags:]([a4 attributeType], objc_msgSend(a4, "storesBinaryDataExternally"));
    if (a4 && [a4 superCompositeAttribute])
    {
      *(_WORD *)&v7->super.super._flags |= 0x20u;
      if (a3)
      {
        uint64_t v8 = *((void *)a3 + 3);
        if (v8) {
          a3 = *(id *)(v8 + 104);
        }
        else {
          a3 = 0;
        }
      }
      v10 = -[NSPropertyDescription _rootName]((__CFString *)a4);
    }
    else
    {
      if (a3)
      {
        uint64_t v9 = *((void *)a3 + 3);
        if (v9) {
          a3 = *(id *)(v9 + 104);
        }
        else {
          a3 = 0;
        }
      }
      v10 = [(NSSQLProperty *)v7 name];
    }
    v7->super.super._slot = [a3 fastIndexForKnownKey:v10];
    *(_WORD *)&v7->super.super._flags = *(_WORD *)&v7->super.super._flags & 0xFFE7 | (16
                                                                                    * ([a4 _propertyType] == 6));
  }
  return v7;
}

- (uint64_t)_sqlTypeForAttributeType:(uint64_t)a1 flags:(uint64_t)a2
{
  uint64_t result = 1;
  if (a1 <= 599)
  {
    if (a1 > 299)
    {
      switch(a1)
      {
        case 300:
          return 2;
        case 400:
          return 4;
        case 500:
          return 7;
      }
    }
    else if (a1 && (a1 == 100 || a1 == 200))
    {
      return result;
    }
    return 6;
  }
  if (a1 <= 999)
  {
    if (a1 != 600)
    {
      if (a1 != 800)
      {
        if (a1 == 900) {
          return 8;
        }
        return 6;
      }
      return result;
    }
    return 7;
  }
  if (a1 > 1199)
  {
    if (a1 != 1200)
    {
      if (a1 == 1800) {
        return 15;
      }
      return 6;
    }
    return 12;
  }
  else
  {
    if (a1 != 1000)
    {
      if (a1 == 1100) {
        return 11;
      }
      return 6;
    }
    if (a2) {
      return 16;
    }
    else {
      return 10;
    }
  }
}

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)NSSQLAttribute;
  [(NSSQLColumn *)&v2 dealloc];
}

- (void)addKeyForTriggerOnRelationship:(id)object
{
  if (object)
  {
    if ((*((_WORD *)object + 16) & 8) != 0)
    {
      id AssociatedObject = objc_getAssociatedObject(object, &NSSQLAttributeTriggerAssociationKey);
      if (AssociatedObject) {
        v4 = AssociatedObject;
      }
      else {
        v4 = NSSet_EmptySet;
      }
    }
    else
    {
      v4 = NSSet_EmptySet;
    }
    v6 = objc_msgSend(v4, "setByAddingObject:", objc_msgSend(a2, "name"));
    objc_setAssociatedObject(object, &NSSQLAttributeTriggerAssociationKey, v6, (void *)0x301);
  }
}

- (BOOL)isFileBackedFuture
{
  id v2 = [(NSSQLProperty *)self propertyDescription];

  return [v2 isFileBackedFuture];
}

@end