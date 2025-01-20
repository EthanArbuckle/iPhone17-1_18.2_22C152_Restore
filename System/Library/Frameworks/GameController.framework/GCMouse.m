@interface GCMouse
+ (GCMouse)current;
+ (NSArray)mice;
- (GCMouse)init;
- (GCMouse)initWithName:(id)a3 additionalButtons:(unsigned int)a4;
- (GCMouseInput)mouseInput;
- (GCMouseLiveInput)liveInput;
- (NSString)debugDescription;
- (NSString)description;
- (NSString)productCategory;
- (NSString)vendorName;
- (OS_dispatch_queue)handlerQueue;
- (void)setHandlerQueue:(id)a3;
@end

@implementation GCMouse

+ (GCMouse)current
{
  if (current_onceToken_0 != -1) {
    dispatch_once(&current_onceToken_0, &__block_literal_global_49);
  }
  v2 = +[_GCControllerManager sharedInstance];
  v3 = [v2 currentMouse];

  return (GCMouse *)v3;
}

uint64_t __18__GCMouse_current__block_invoke()
{
  return +[GCFrameworkInitialization enableMouseSupportWithReason:3];
}

+ (NSArray)mice
{
  if (mice_onceToken != -1) {
    dispatch_once(&mice_onceToken, &__block_literal_global_109_0);
  }
  v2 = +[_GCControllerManager sharedInstance];
  v3 = [v2 mice];

  return (NSArray *)v3;
}

uint64_t __15__GCMouse_mice__block_invoke()
{
  return +[GCFrameworkInitialization enableMouseSupportWithReason:2];
}

- (GCMouse)initWithName:(id)a3 additionalButtons:(unsigned int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v6 = a3;
  v16.receiver = self;
  v16.super_class = (Class)GCMouse;
  v7 = [(GCMouse *)&v16 init];
  v8 = v7;
  if (v7)
  {
    objc_storeStrong((id *)&v7->_handlerQueue, &_dispatch_main_q);
    uint64_t v9 = [v6 copy];
    vendorName = v8->_vendorName;
    v8->_vendorName = (NSString *)v9;

    v11 = [GCMouseInput alloc];
    v12 = +[NSUUID UUID];
    uint64_t v13 = [(GCMouseInput *)v11 initWithIdentifier:v12 additionalButtons:v4];
    mouseInput = v8->_mouseInput;
    v8->_mouseInput = (GCMouseInput *)v13;

    [(GCPhysicalInputProfile *)v8->_mouseInput setDevice:v8];
  }

  return v8;
}

- (GCMouse)init
{
  return [(GCMouse *)self initWithName:@"Generic Mouse" additionalButtons:0];
}

- (NSString)vendorName
{
  return self->_vendorName;
}

- (NSString)productCategory
{
  return (NSString *)@"Mouse";
}

- (GCMouseInput)mouseInput
{
  return self->_mouseInput;
}

- (GCMouseLiveInput)liveInput
{
  v2 = [(GCMouse *)self mouseInput];
  v3 = -[GCMouseInput liveInputFacade](v2);

  return (GCMouseLiveInput *)v3;
}

- (NSString)description
{
  return (NSString *)@"Mouse";
}

- (NSString)debugDescription
{
  v3 = (objc_class *)objc_opt_class();
  uint64_t v4 = NSStringFromClass(v3);
  v5 = +[NSString stringWithFormat:@"<%@ %p>", v4, self];

  return (NSString *)v5;
}

- (OS_dispatch_queue)handlerQueue
{
  return self->_handlerQueue;
}

- (void)setHandlerQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mouseInput, 0);
  objc_storeStrong((id *)&self->_handlerQueue, 0);

  objc_storeStrong((id *)&self->_vendorName, 0);
}

@end