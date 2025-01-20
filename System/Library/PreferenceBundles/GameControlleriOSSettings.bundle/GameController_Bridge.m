@interface GameController_Bridge
+ (BOOL)gcControllerElement_remappable:(id)a3;
+ (id)gcControllerElement_primaryAlias:(id)a3;
+ (id)gcController_persistentIdentifier:(id)a3;
+ (id)gcsController_initWithController:(id)a3;
+ (id)gcsElement_initWithControllerEmenet:(id)a3;
+ (int)gcControllerElement_remappingKey:(id)a3;
@end

@implementation GameController_Bridge

+ (BOOL)gcControllerElement_remappable:(id)a3
{
  return [a3 remappable];
}

+ (int)gcControllerElement_remappingKey:(id)a3
{
  return [a3 remappingKey];
}

+ (id)gcControllerElement_primaryAlias:(id)a3
{
  return [a3 primaryAlias];
}

+ (id)gcController_persistentIdentifier:(id)a3
{
  id v3 = a3;
  v4 = [v3 identifier];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    v6 = [v3 identifier];
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

+ (id)gcsController_initWithController:(id)a3
{
  id v3 = a3;
  id v4 = [objc_alloc((Class)GCSController) initWithController:v3];

  return v4;
}

+ (id)gcsElement_initWithControllerEmenet:(id)a3
{
  id v3 = a3;
  id v4 = [objc_alloc((Class)GCSElement) initWithElement:v3];

  return v4;
}

@end