@interface DOCUIPBrowserState
- (BOOL)tabIsSpecified;
- (unint64_t)tab;
- (void)setTab:(unint64_t)a3;
@end

@implementation DOCUIPBrowserState

- (BOOL)tabIsSpecified
{
  return [(DOCUIPBrowserState *)self contentMode] != (id)-1;
}

- (unint64_t)tab
{
  v2 = self;
  id v3 = [(DOCUIPBrowserState *)v2 contentMode];
  if ((unint64_t)v3 + 1 >= 4)
  {
    type metadata accessor for DOCUIPBrowserContentMode(0);
    unint64_t result = sub_1004CF0A0();
    __break(1u);
  }
  else
  {
    unint64_t v4 = qword_1004EEEF8[(void)v3 + 1];

    return v4;
  }
  return result;
}

- (void)setTab:(unint64_t)a3
{
  if (a3 >= 3)
  {
    type metadata accessor for DOCTab(0);
    unint64_t v4 = self;
    sub_1004CF0A0();
    __break(1u);
  }
  else
  {
    -[DOCUIPBrowserState setContentMode:](self, "setContentMode:");
  }
}

@end