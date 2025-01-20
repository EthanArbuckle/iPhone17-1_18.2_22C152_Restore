@interface GCKeyboard
+ (GCKeyboard)coalescedKeyboard;
- (GCKeyboard)init;
- (GCKeyboardInput)keyboardInput;
- (NSString)debugDescription;
- (NSString)description;
- (NSString)productCategory;
- (NSString)vendorName;
- (OS_dispatch_queue)handlerQueue;
- (void)setHandlerQueue:(id)a3;
@end

@implementation GCKeyboard

+ (GCKeyboard)coalescedKeyboard
{
  if (coalescedKeyboard_onceToken != -1) {
    dispatch_once(&coalescedKeyboard_onceToken, &__block_literal_global_8);
  }
  v2 = +[_GCControllerManager sharedInstance];
  v3 = [v2 coalescedKeyboard];

  return (GCKeyboard *)v3;
}

uint64_t __31__GCKeyboard_coalescedKeyboard__block_invoke()
{
  return +[GCFrameworkInitialization enableKeyboardSupportWithReason:3];
}

- (GCKeyboard)init
{
  v7.receiver = self;
  v7.super_class = (Class)GCKeyboard;
  v2 = [(GCKeyboard *)&v7 init];
  v3 = v2;
  if (v2)
  {
    objc_storeStrong((id *)&v2->_handlerQueue, &_dispatch_main_q);
    v4 = objc_alloc_init(GCKeyboardInput);
    keyboardInput = v3->_keyboardInput;
    v3->_keyboardInput = v4;

    [(GCPhysicalInputProfile *)v3->_keyboardInput setDevice:v3];
  }
  return v3;
}

- (NSString)vendorName
{
  return (NSString *)@"Generic Keyboard";
}

- (NSString)productCategory
{
  return (NSString *)@"Keyboard";
}

- (NSString)description
{
  return (NSString *)@"Keyboard";
}

- (NSString)debugDescription
{
  v3 = (objc_class *)objc_opt_class();
  v4 = NSStringFromClass(v3);
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

- (GCKeyboardInput)keyboardInput
{
  return self->_keyboardInput;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_keyboardInput, 0);

  objc_storeStrong((id *)&self->_handlerQueue, 0);
}

@end