@interface IMBWebNavigationToolbar
- (_TtC8Business23IMBWebNavigationToolbar)init;
- (_TtC8Business23IMBWebNavigationToolbar)initWithCoder:(id)a3;
- (_TtC8Business23IMBWebNavigationToolbar)initWithFrame:(CGRect)a3;
- (id)initInView:(id)a3 withFrame:(CGRect)a4 withItemList:(id)a5;
- (void)done;
- (void)nextPage;
- (void)previousPage;
- (void)refresh;
@end

@implementation IMBWebNavigationToolbar

- (_TtC8Business23IMBWebNavigationToolbar)init
{
  return (_TtC8Business23IMBWebNavigationToolbar *)sub_10001B424();
}

- (_TtC8Business23IMBWebNavigationToolbar)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_10001BDDC();
}

- (void)previousPage
{
}

- (void)nextPage
{
}

- (void)refresh
{
  v2 = self;
  sub_10001B99C();
}

- (void)done
{
  v2 = self;
  sub_10001BADC();
}

- (_TtC8Business23IMBWebNavigationToolbar)initWithFrame:(CGRect)a3
{
  result = (_TtC8Business23IMBWebNavigationToolbar *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (id)initInView:(id)a3 withFrame:(CGRect)a4 withItemList:(id)a5
{
  id v5 = a3;
  id result = (id)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8Business23IMBWebNavigationToolbar____lazy_storage___previousButtonItem));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8Business23IMBWebNavigationToolbar____lazy_storage___nextButtonItem));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8Business23IMBWebNavigationToolbar____lazy_storage___refreshButtonItem));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8Business23IMBWebNavigationToolbar____lazy_storage___doneButtonItem));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8Business23IMBWebNavigationToolbar____lazy_storage___secureContentMessageItem));
  id v3 = (char *)self + OBJC_IVAR____TtC8Business23IMBWebNavigationToolbar_actionDelegate;

  sub_100010D28((uint64_t)v3);
}

@end