@interface HFPropertyDifference
+ (BOOL)object:(id)a3 isEqualToObject:(id)a4;
+ (id)compareObjectA:(id)a3 toObjectB:(id)a4 key:(id)a5 priority:(unint64_t)a6;
- (HFPropertyDifference)initWithObjectA:(id)a3 toObjectB:(id)a4 key:(id)a5 priority:(unint64_t)a6;
- (id)copyWithZone:(_NSZone *)a3;
- (id)descriptionBuilder;
- (id)valueA;
- (id)valueB;
- (void)setValueA:(id)a3;
- (void)setValueB:(id)a3;
@end

@implementation HFPropertyDifference

- (HFPropertyDifference)initWithObjectA:(id)a3 toObjectB:(id)a4 key:(id)a5 priority:(unint64_t)a6
{
  id v11 = a3;
  id v12 = a4;
  v16.receiver = self;
  v16.super_class = (Class)HFPropertyDifference;
  v13 = [(HFDifference *)&v16 initWithKey:a5 priority:a6];
  v14 = v13;
  if (v13)
  {
    objc_storeStrong(&v13->_valueA, a3);
    objc_storeStrong(&v14->_valueB, a4);
  }

  return v14;
}

+ (id)compareObjectA:(id)a3 toObjectB:(id)a4 key:(id)a5 priority:(unint64_t)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if ([a1 object:v10 isEqualToObject:v11]) {
    v13 = 0;
  }
  else {
    v13 = (void *)[objc_alloc((Class)a1) initWithObjectA:v10 toObjectB:v11 key:v12 priority:a6];
  }

  return v13;
}

+ (BOOL)object:(id)a3 isEqualToObject:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = v5;
  id v8 = v6;
  v9 = v8;
  if (v7 == v8)
  {
    char v11 = 1;
    id v12 = v7;
    id v13 = v7;
LABEL_16:

    goto LABEL_17;
  }
  if (!v7)
  {

    goto LABEL_7;
  }
  char v10 = [v7 isEqual:v8];

  if ((v10 & 1) == 0)
  {
LABEL_7:
    objc_opt_class();
    id v14 = v7;
    if (objc_opt_isKindOfClass()) {
      v15 = v14;
    }
    else {
      v15 = 0;
    }
    id v13 = v15;

    objc_opt_class();
    id v16 = v9;
    if (objc_opt_isKindOfClass()) {
      v17 = v16;
    }
    else {
      v17 = 0;
    }
    id v12 = v17;

    char v11 = 0;
    if (v13 && v12)
    {
      char v11 = [v13 isEqualToString:v12];
      id v12 = v16;
      id v13 = v14;
    }
    goto LABEL_16;
  }
  char v11 = 1;
LABEL_17:

  return v11;
}

- (id)descriptionBuilder
{
  v11.receiver = self;
  v11.super_class = (Class)HFPropertyDifference;
  v3 = [(HFDifference *)&v11 descriptionBuilder];
  v4 = [(HFPropertyDifference *)self valueA];
  if (_MergedGlobals_3 != -1) {
    dispatch_once(&_MergedGlobals_3, &__block_literal_global_70_2);
  }
  id v5 = (id)qword_26AB2E6B8;
  id v6 = (id)[v3 appendObject:v4 withName:v5];

  id v7 = [(HFPropertyDifference *)self valueB];
  if (qword_26AB2E6C0 != -1) {
    dispatch_once(&qword_26AB2E6C0, &__block_literal_global_77);
  }
  id v8 = (id)qword_26AB2E6C8;
  id v9 = (id)[v3 appendObject:v7 withName:v8];

  return v3;
}

void __42__HFPropertyDifference_descriptionBuilder__block_invoke_2()
{
  v0 = (void *)qword_26AB2E6B8;
  qword_26AB2E6B8 = @"valueA";
}

void __42__HFPropertyDifference_descriptionBuilder__block_invoke_4()
{
  v0 = (void *)qword_26AB2E6C8;
  qword_26AB2E6C8 = @"valueB";
}

- (id)copyWithZone:(_NSZone *)a3
{
  v11.receiver = self;
  v11.super_class = (Class)HFPropertyDifference;
  id v4 = [(HFDifference *)&v11 copyWithZone:a3];
  objc_opt_class();
  id v5 = v4;
  if (objc_opt_isKindOfClass()) {
    id v6 = v5;
  }
  else {
    id v6 = 0;
  }
  id v7 = v6;

  id v8 = [(HFPropertyDifference *)self valueA];
  [v7 setValueA:v8];

  id v9 = [(HFPropertyDifference *)self valueB];
  [v7 setValueB:v9];

  return v7;
}

- (id)valueA
{
  return self->_valueA;
}

- (void)setValueA:(id)a3
{
}

- (id)valueB
{
  return self->_valueB;
}

- (void)setValueB:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_valueB, 0);
  objc_storeStrong(&self->_valueA, 0);
}

@end