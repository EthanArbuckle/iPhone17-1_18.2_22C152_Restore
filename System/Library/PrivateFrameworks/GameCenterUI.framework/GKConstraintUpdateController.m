@interface GKConstraintUpdateController
+ (id)sharedController;
- (NSPointerArray)constraintsToUpdate;
- (void)_updateConstraints;
- (void)dealloc;
- (void)registerConstraint:(id)a3 leading:(double)a4 forFontTextStyle:(id)a5;
- (void)setConstraintsToUpdate:(id)a3;
- (void)updateConstraint:(id)a3;
@end

@implementation GKConstraintUpdateController

+ (id)sharedController
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __48__GKConstraintUpdateController_sharedController__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedController_onceToken != -1) {
    dispatch_once(&sharedController_onceToken, block);
  }
  v2 = (void *)sharedController_controller;

  return v2;
}

uint64_t __48__GKConstraintUpdateController_sharedController__block_invoke(uint64_t a1)
{
  id v1 = objc_alloc_init(*(Class *)(a1 + 32));
  uint64_t v2 = sharedController_controller;
  sharedController_controller = (uint64_t)v1;

  return MEMORY[0x1F41817F8](v1, v2);
}

- (void)dealloc
{
  v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)GKConstraintUpdateController;
  [(GKConstraintUpdateController *)&v4 dealloc];
}

- (void)updateConstraint:(id)a3
{
  if (a3)
  {
    id v3 = a3;
    objc_super v4 = objc_getAssociatedObject(v3, sel__gkConstraintInfo);
    id v16 = v4;
    if (!v4)
    {
      v5 = NSString;
      v6 = [NSString stringWithFormat:@"Assertion failed"];
      v7 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterUI/iOS/Framework/NSLayoutConstraint+GKAdditions.m"];
      id v8 = [v7 lastPathComponent];
      v9 = [v5 stringWithFormat:@"%@ (leadingInfo != ((void *)0))\n[%s (%s:%d)]", v6, "-[GKConstraintUpdateController updateConstraint:]", objc_msgSend(v8, "UTF8String"), 546];

      [MEMORY[0x1E4F1CA00] raise:@"GameKit Exception", @"%@", v9 format];
      objc_super v4 = 0;
    }
    [v4 leading];
    double v11 = v10;
    v12 = (void *)MEMORY[0x1E4F639F8];
    v13 = [v16 fontTextStyle];
    if (v11 == 0.0) {
      [v12 standardLeadingForFontTextStyle:v13];
    }
    else {
      [v12 scaledValueFromHISpecLeading:v13 forFontTextStyle:v11];
    }
    double v15 = v14;

    [v3 setConstant:v15];
  }
}

- (void)_updateConstraints
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  [(NSPointerArray *)self->_constraintsToUpdate compact];
  if ([(NSPointerArray *)self->_constraintsToUpdate count])
  {
    long long v11 = 0u;
    long long v12 = 0u;
    long long v9 = 0u;
    long long v10 = 0u;
    id v3 = self->_constraintsToUpdate;
    uint64_t v4 = [(NSPointerArray *)v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    if (v4)
    {
      uint64_t v5 = v4;
      uint64_t v6 = *(void *)v10;
      do
      {
        for (uint64_t i = 0; i != v5; ++i)
        {
          if (*(void *)v10 != v6) {
            objc_enumerationMutation(v3);
          }
          [(GKConstraintUpdateController *)self updateConstraint:*(void *)(*((void *)&v9 + 1) + 8 * i)];
        }
        uint64_t v5 = [(NSPointerArray *)v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
      }
      while (v5);
    }
  }
  else
  {
    id v8 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v8 removeObserver:self];
  }
}

- (void)registerConstraint:(id)a3 leading:(double)a4 forFontTextStyle:(id)a5
{
  id object = a3;
  id v8 = a5;
  long long v9 = objc_alloc_init(GKConstraintLeadingInfo);
  [(GKConstraintLeadingInfo *)v9 setLeading:a4];
  [(GKConstraintLeadingInfo *)v9 setFontTextStyle:v8];

  objc_setAssociatedObject(object, sel__gkConstraintInfo, v9, (void *)1);
  constraintsToUpdate = self->_constraintsToUpdate;
  if (!constraintsToUpdate)
  {
    long long v11 = [MEMORY[0x1E4F28F50] pointerArrayWithOptions:5];
    long long v12 = self->_constraintsToUpdate;
    self->_constraintsToUpdate = v11;

    constraintsToUpdate = self->_constraintsToUpdate;
  }
  if (![(NSPointerArray *)constraintsToUpdate count])
  {
    v13 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v13 addObserver:self selector:sel__updateConstraints name:*MEMORY[0x1E4FB27A8] object:0];
  }
  [(GKConstraintUpdateController *)self updateConstraint:object];
  [(NSPointerArray *)self->_constraintsToUpdate addPointer:object];
}

- (NSPointerArray)constraintsToUpdate
{
  return self->_constraintsToUpdate;
}

- (void)setConstraintsToUpdate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end