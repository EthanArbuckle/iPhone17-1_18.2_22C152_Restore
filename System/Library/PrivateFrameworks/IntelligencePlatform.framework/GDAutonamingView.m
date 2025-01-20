@interface GDAutonamingView
- (GDAutonamingView)initWithInner:(id)a3;
- (GDAutonamingView)initWithViewName:(id)a3 error:(id *)a4;
- (id)personForIdentifier:(id)a3;
- (id)personForIdentifier:(id)a3 ofType:(id)a4;
- (void)confirmWithIdentifier:(id)a3 ofType:(id)a4 person:(id)a5;
- (void)confirmWithIdentifier:(id)a3 ofType:(id)a4 person:(id)a5 confirmationType:(int64_t)a6;
- (void)confirmWithIdentifier:(id)a3 person:(id)a4 confirmationType:(int64_t)a5;
- (void)didUpdateUserFeedback;
- (void)rejectWithIdentifier:(id)a3 ofType:(id)a4 person:(id)a5;
- (void)rejectWithIdentifier:(id)a3 ofType:(id)a4 person:(id)a5 confirmationType:(int64_t)a6;
- (void)rejectWithIdentifier:(id)a3 person:(id)a4 confirmationType:(int64_t)a5;
- (void)reset;
@end

@implementation GDAutonamingView

- (void).cxx_destruct
{
}

- (void)reset
{
}

- (void)rejectWithIdentifier:(id)a3 ofType:(id)a4 person:(id)a5
{
}

- (void)rejectWithIdentifier:(id)a3 ofType:(id)a4 person:(id)a5 confirmationType:(int64_t)a6
{
}

- (void)rejectWithIdentifier:(id)a3 person:(id)a4 confirmationType:(int64_t)a5
{
}

- (void)confirmWithIdentifier:(id)a3 ofType:(id)a4 person:(id)a5
{
}

- (void)confirmWithIdentifier:(id)a3 ofType:(id)a4 person:(id)a5 confirmationType:(int64_t)a6
{
}

- (void)confirmWithIdentifier:(id)a3 person:(id)a4 confirmationType:(int64_t)a5
{
}

- (void)didUpdateUserFeedback
{
}

- (id)personForIdentifier:(id)a3 ofType:(id)a4
{
  return (id)((uint64_t (*)(GDAutonamingViewInner *, char *, id, id))MEMORY[0x1F4181798])(self->_inner, sel_objCPersonFor_, a3, a4);
}

- (id)personForIdentifier:(id)a3
{
  return (id)((uint64_t (*)(GDAutonamingViewInner *, char *, id))MEMORY[0x1F4181798])(self->_inner, sel_objCPersonFor_, a3);
}

- (GDAutonamingView)initWithViewName:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v11 = objc_msgSend_clientService(GDSwiftViewService, v7, v8, v9, v10);
  v14 = objc_msgSend_autonamingViewWithViewName_error_(v11, v12, (uint64_t)v6, (uint64_t)a4, v13);

  if (v14)
  {
    self = (GDAutonamingView *)(id)objc_msgSend_initWithInner_(self, v15, (uint64_t)v14, v16, v17);
    v18 = self;
  }
  else
  {
    v18 = 0;
  }

  return v18;
}

- (GDAutonamingView)initWithInner:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)GDAutonamingView;
  id v6 = [(GDAutonamingView *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_inner, a3);
  }

  return v7;
}

@end