@interface ZoomUI_UIDragInteraction
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (void)_sessionHandedOffDragImage:(id)a3;
- (void)_sessionWillEnd:(id)a3 withOperation:(unint64_t)a4;
@end

@implementation ZoomUI_UIDragInteraction

+ (id)safeCategoryTargetClassName
{
  return @"UIDragInteraction";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (void)_sessionHandedOffDragImage:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)ZoomUI_UIDragInteraction;
  [(ZoomUI_UIDragInteraction *)&v4 _sessionHandedOffDragImage:a3];
  v3 = [getZoomServicesClass() sharedInstance];
  [v3 notifyZoomDragWillStart];
}

- (void)_sessionWillEnd:(id)a3 withOperation:(unint64_t)a4
{
  v5.receiver = self;
  v5.super_class = (Class)ZoomUI_UIDragInteraction;
  [(ZoomUI_UIDragInteraction *)&v5 _sessionWillEnd:a3 withOperation:a4];
  objc_super v4 = [getZoomServicesClass() sharedInstance];
  [v4 notifyZoomDragWillEnd];
}

@end