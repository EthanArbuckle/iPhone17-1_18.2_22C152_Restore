@interface MSCategoryTriageAction
- (BOOL)isUndoSupported;
- (MSCategoryTriageAction)initWithMessageListSelection:(id)a3 origin:(int64_t)a4 actor:(int64_t)a5 delegate:(id)a6 categoryType:(unint64_t)a7 changeOptions:(unint64_t)a8;
- (id)_changeAction;
- (unint64_t)categoryType;
- (unint64_t)changeOptions;
- (void)setCategoryType:(unint64_t)a3;
@end

@implementation MSCategoryTriageAction

- (MSCategoryTriageAction)initWithMessageListSelection:(id)a3 origin:(int64_t)a4 actor:(int64_t)a5 delegate:(id)a6 categoryType:(unint64_t)a7 changeOptions:(unint64_t)a8
{
  v11.receiver = self;
  v11.super_class = (Class)MSCategoryTriageAction;
  result = [(MSTriageAction *)&v11 initWithMessageListSelection:a3 origin:a4 actor:a5 delegate:a6];
  if (result)
  {
    result->_categoryType = a7;
    result->_changeOptions = a8;
  }
  return result;
}

- (BOOL)isUndoSupported
{
  return 0;
}

- (id)_changeAction
{
  id v3 = objc_alloc(MEMORY[0x1E4F60328]);
  v4 = [(MSTriageAction *)self messageListItemSelection];
  v5 = [v4 messageListItems];
  v6 = objc_msgSend(v3, "initWithMessageListItems:origin:actor:categoryType:changeOptions:", v5, -[MSTriageAction origin](self, "origin"), -[MSTriageAction actor](self, "actor"), -[MSCategoryTriageAction categoryType](self, "categoryType"), -[MSCategoryTriageAction changeOptions](self, "changeOptions"));

  return v6;
}

- (unint64_t)categoryType
{
  return self->_categoryType;
}

- (void)setCategoryType:(unint64_t)a3
{
  self->_categoryType = a3;
}

- (unint64_t)changeOptions
{
  return self->_changeOptions;
}

@end