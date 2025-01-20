@interface MBContainer
+ (id)containerWithPropertyList:(id)a3 volumeMountPoint:(id)a4;
+ (id)uninstalledContainerWithDomainName:(id)a3 volumeMountPoint:(id)a4;
- (BOOL)isEqual:(id)a3;
- (BOOL)isSafeHarbor;
- (BOOL)isSystemContainer;
- (BOOL)isSystemSharedContainer;
- (MBContainer)initWithPropertyList:(id)a3 volumeMountPoint:(id)a4;
- (NSDate)datePlacedInSafeHarbor;
- (NSString)containerDir;
- (NSString)containerTypeString;
- (NSString)identifier;
- (NSString)safeHarborDir;
- (NSString)volumeMountPoint;
- (id)copyWithVolumeMountPoint:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)domain;
- (id)propertyListForBackupProperties;
- (id)propertyListForSafeHarborInfo;
- (int)containerType;
- (unint64_t)hash;
- (void)setContainerDir:(id)a3;
- (void)setDatePlacedInSafeHarbor:(id)a3;
@end

@implementation MBContainer

+ (id)uninstalledContainerWithDomainName:(id)a3 volumeMountPoint:(id)a4
{
  v13[0] = kCFBundleIdentifierKey;
  id v5 = a4;
  id v6 = a3;
  v7 = +[MBDomain containerIDWithName:v6];
  v13[1] = @"ContainerContentClass";
  v14[0] = v7;
  unsigned int v8 = +[MBDomain containerTypeWithName:v6];

  if (v8 - 1 > 4) {
    v9 = 0;
  }
  else {
    v9 = off_28BB8[v8 - 1];
  }
  v14[1] = v9;
  v10 = +[NSDictionary dictionaryWithObjects:v14 forKeys:v13 count:2];

  v11 = +[MBContainer containerWithPropertyList:v10 volumeMountPoint:v5];

  return v11;
}

+ (id)containerWithPropertyList:(id)a3 volumeMountPoint:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = [v5 objectForKeyedSubscript:@"ContainerContentClass"];
  int v8 = sub_583C(v7);

  id v9 = [objc_alloc(off_28BE0[v8]->isa) initWithPropertyList:v5 volumeMountPoint:v6];

  return v9;
}

- (MBContainer)initWithPropertyList:(id)a3 volumeMountPoint:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)MBContainer;
  int v8 = [(MBContainer *)&v12 init];
  if (v8)
  {
    id v9 = (NSMutableDictionary *)[v6 mutableCopy];
    plist = v8->_plist;
    v8->_plist = v9;

    objc_storeStrong((id *)&v8->_volumeMountPoint, a4);
  }

  return v8;
}

- (id)copyWithVolumeMountPoint:(id)a3
{
  id v4 = a3;
  id v5 = [(MBContainer *)self copy];
  id v6 = (void *)v5[2];
  v5[2] = v4;

  return v5;
}

- (BOOL)isSafeHarbor
{
  v2 = [(MBContainer *)self datePlacedInSafeHarbor];
  BOOL v3 = v2 != 0;

  return v3;
}

- (BOOL)isSystemContainer
{
  return [(MBContainer *)self containerType] == 4;
}

- (BOOL)isSystemSharedContainer
{
  return [(MBContainer *)self containerType] == 5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = [(NSMutableDictionary *)self->_plist mutableCopyWithZone:a3];
  id v7 = (void *)*((void *)v5 + 1);
  *((void *)v5 + 1) = v6;

  objc_storeStrong((id *)v5 + 2, self->_volumeMountPoint);
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()])
  {
    id v5 = [(MBContainer *)self identifier];
    id v6 = [v4 identifier];
    unsigned __int8 v7 = [v5 isEqualToString:v6];
  }
  else
  {
    unsigned __int8 v7 = 0;
  }

  return v7;
}

- (unint64_t)hash
{
  v2 = [(MBContainer *)self identifier];
  id v3 = [v2 hash];

  return (unint64_t)v3;
}

- (NSString)identifier
{
  return (NSString *)[(NSMutableDictionary *)self->_plist objectForKeyedSubscript:kCFBundleIdentifierKey];
}

- (int)containerType
{
  v2 = [(MBContainer *)self containerTypeString];
  int v3 = sub_583C(v2);

  return v3;
}

- (NSString)containerTypeString
{
  return (NSString *)[(NSMutableDictionary *)self->_plist objectForKeyedSubscript:@"ContainerContentClass"];
}

- (NSString)containerDir
{
  return (NSString *)[(NSMutableDictionary *)self->_plist objectForKeyedSubscript:@"Container"];
}

- (void)setContainerDir:(id)a3
{
}

- (NSString)safeHarborDir
{
  if (![(MBContainer *)self isSafeHarbor])
  {
    unsigned __int8 v7 = +[NSAssertionHandler currentHandler];
    [v7 handleFailureInMethod:a2 object:self file:@"MBApp.m" lineNumber:307 description:@"Not a safe harbor"];
  }
  id v4 = [(MBContainer *)self containerDir];
  id v5 = [v4 stringByDeletingLastPathComponent];

  return (NSString *)v5;
}

- (NSDate)datePlacedInSafeHarbor
{
  return (NSDate *)[(NSMutableDictionary *)self->_plist objectForKeyedSubscript:@"SafeHarborDockingDate"];
}

- (void)setDatePlacedInSafeHarbor:(id)a3
{
}

- (id)propertyListForSafeHarborInfo
{
  return self->_plist;
}

- (id)propertyListForBackupProperties
{
  int v3 = +[NSMutableDictionary dictionaryWithCapacity:0];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v4 = self->_plist;
  id v5 = [(NSMutableDictionary *)v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v13;
    do
    {
      int v8 = 0;
      do
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v12 + 1) + 8 * (void)v8);
        v10 = -[NSMutableDictionary objectForKeyedSubscript:](self->_plist, "objectForKeyedSubscript:", v9, (void)v12);
        if (qword_2EA78 != -1) {
          dispatch_once(&qword_2EA78, &stru_28A78);
        }
        if ([(id)qword_2EA70 containsObject:v9]) {
          [v3 setObject:v10 forKeyedSubscript:v9];
        }

        int v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      id v6 = [(NSMutableDictionary *)v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v6);
  }

  return v3;
}

- (id)domain
{
  return 0;
}

- (NSString)volumeMountPoint
{
  return self->_volumeMountPoint;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_volumeMountPoint, 0);

  objc_storeStrong((id *)&self->_plist, 0);
}

@end