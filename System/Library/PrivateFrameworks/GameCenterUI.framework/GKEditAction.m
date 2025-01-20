@interface GKEditAction
+ (id)actionWithName:(id)a3 selector:(SEL)a4;
+ (id)deleteActionWithName:(id)a3;
- (BOOL)destructive;
- (NSString)name;
- (SEL)selector;
- (void)setDestructive:(BOOL)a3;
- (void)setName:(id)a3;
- (void)setSelector:(SEL)a3;
@end

@implementation GKEditAction

+ (id)actionWithName:(id)a3 selector:(SEL)a4
{
  id v5 = a3;
  v6 = objc_alloc_init(GKEditAction);
  [(GKEditAction *)v6 setName:v5];

  [(GKEditAction *)v6 setSelector:a4];

  return v6;
}

+ (id)deleteActionWithName:(id)a3
{
  v3 = +[GKEditAction actionWithName:a3 selector:sel_swipeToDeleteCell_];
  [v3 setDestructive:1];

  return v3;
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
}

- (SEL)selector
{
  if (self->_selector) {
    return self->_selector;
  }
  else {
    return 0;
  }
}

- (void)setSelector:(SEL)a3
{
  if (a3) {
    v3 = a3;
  }
  else {
    v3 = 0;
  }
  self->_selector = v3;
}

- (BOOL)destructive
{
  return self->_destructive;
}

- (void)setDestructive:(BOOL)a3
{
  self->_destructive = a3;
}

- (void).cxx_destruct
{
}

@end