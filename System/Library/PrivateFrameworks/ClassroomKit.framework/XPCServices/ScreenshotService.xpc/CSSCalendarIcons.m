@interface CSSCalendarIcons
- (NSBundle)classroomKitBundle;
- (NSData)badgeIconData;
- (NSData)iconData;
- (id)classroomKitImageNamed:(id)a3;
@end

@implementation CSSCalendarIcons

- (NSData)iconData
{
  return (NSData *)[(CSSCalendarIcons *)self classroomKitImageNamed:@"CalendarIcon"];
}

- (NSData)badgeIconData
{
  return (NSData *)[(CSSCalendarIcons *)self classroomKitImageNamed:@"CalendarBadgeIcon"];
}

- (id)classroomKitImageNamed:(id)a3
{
  id v5 = a3;
  if (!+[NSThread isMainThread])
  {
    v10 = +[NSAssertionHandler currentHandler];
    v11 = NSStringFromSelector(a2);
    [v10 handleFailureInMethod:a2, self, @"CSSCalendarIcons.m", 39, @"%@ must be called from the main thread", v11 object file lineNumber description];
  }
  v6 = [(CSSCalendarIcons *)self classroomKitBundle];
  v7 = +[UIImage imageNamed:v5 inBundle:v6];

  if (v7)
  {
    v8 = UIImagePNGRepresentation(v7);
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (NSBundle)classroomKitBundle
{
  classroomKitBundle = self->_classroomKitBundle;
  if (!classroomKitBundle)
  {
    v4 = +[NSBundle bundleWithIdentifier:CRKClassroomKitBundleIdentifier];
    id v5 = self->_classroomKitBundle;
    self->_classroomKitBundle = v4;

    classroomKitBundle = self->_classroomKitBundle;
  }

  return classroomKitBundle;
}

- (void).cxx_destruct
{
}

@end