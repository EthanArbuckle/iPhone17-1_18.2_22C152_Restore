@interface SplitViewNavigationController
- (_TtC7SwiftUI29SplitViewNavigationController)initWithCoder:(id)a3;
- (_TtC7SwiftUI29SplitViewNavigationController)initWithRootViewController:(id)a3;
@end

@implementation SplitViewNavigationController

- (_TtC7SwiftUI29SplitViewNavigationController)initWithRootViewController:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for SplitViewNavigationController();
  return [(UIKitNavigationController *)&v5 initWithRootViewController:a3];
}

- (_TtC7SwiftUI29SplitViewNavigationController)initWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for SplitViewNavigationController();
  return [(UIKitNavigationController *)&v5 initWithCoder:a3];
}

@end