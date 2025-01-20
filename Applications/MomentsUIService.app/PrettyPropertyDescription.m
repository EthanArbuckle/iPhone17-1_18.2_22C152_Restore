@interface PrettyPropertyDescription
+ (id)describingPropertyNamed:(id)a3 withClassName:(id)a4 andValue:(id)a5 andRecursiveDepth:(unint64_t)a6;
+ (id)describingPropertyNamed:(id)a3 withClassType:(Class)a4 andValue:(id)a5 andRecursiveDepth:(unint64_t)a6;
- (NSString)className;
- (NSString)propertyName;
- (PrettyPropertyDescription)initWithClassName:(id)a3 propertyName:(id)a4 andPropertyValue:(id)a5 andRecursiveDepth:(unint64_t)a6;
- (id)propertyValue;
@end

@implementation PrettyPropertyDescription

- (PrettyPropertyDescription)initWithClassName:(id)a3 propertyName:(id)a4 andPropertyValue:(id)a5 andRecursiveDepth:(unint64_t)a6
{
  v9 = (NSString *)a3;
  id v10 = a5;
  v18.receiver = self;
  v18.super_class = (Class)PrettyPropertyDescription;
  v11 = (__CFString *)a4;
  v12 = [(PrettyPropertyDescription *)&v18 init];
  className = v12->_className;
  v12->_className = v9;
  v14 = v9;

  if (v11) {
    v15 = v11;
  }
  else {
    v15 = &stru_100229C18;
  }
  objc_storeStrong((id *)&v12->_propertyName, v15);
  id propertyValue = v12->_propertyValue;
  v12->_id propertyValue = v10;

  return v12;
}

+ (id)describingPropertyNamed:(id)a3 withClassName:(id)a4 andValue:(id)a5 andRecursiveDepth:(unint64_t)a6
{
  id v9 = a5;
  id v10 = a4;
  id v11 = a3;
  v12 = [[PrettyPropertyDescription alloc] initWithClassName:v10 propertyName:v11 andPropertyValue:v9 andRecursiveDepth:a6];

  return v12;
}

+ (id)describingPropertyNamed:(id)a3 withClassType:(Class)a4 andValue:(id)a5 andRecursiveDepth:(unint64_t)a6
{
  id v9 = a5;
  id v10 = a3;
  id v11 = NSStringFromClass(a4);
  v12 = +[PrettyPropertyDescription describingPropertyNamed:v10 withClassName:v11 andValue:v9 andRecursiveDepth:a6];

  return v12;
}

- (NSString)className
{
  return self->_className;
}

- (NSString)propertyName
{
  return self->_propertyName;
}

- (id)propertyValue
{
  return self->_propertyValue;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_propertyValue, 0);
  objc_storeStrong((id *)&self->_propertyName, 0);

  objc_storeStrong((id *)&self->_className, 0);
}

@end