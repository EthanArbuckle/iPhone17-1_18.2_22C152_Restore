@interface RichLinkView
- (RichLinkPluginDataSource)dataSource;
- (id)interactiveViews;
- (void)didMoveToSuperview;
- (void)setDataSource:(id)a3;
@end

@implementation RichLinkView

- (void)didMoveToSuperview
{
  v4.receiver = self;
  v4.super_class = (Class)RichLinkView;
  [(RichLinkView *)&v4 didMoveToSuperview];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  [WeakRetained richLinkViewDidMoveToSuperview:self];
}

- (id)interactiveViews
{
  objc_super v4 = self;
  v2 = +[NSArray arrayWithObjects:&v4 count:1];

  return v2;
}

- (RichLinkPluginDataSource)dataSource
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);

  return (RichLinkPluginDataSource *)WeakRetained;
}

- (void)setDataSource:(id)a3
{
}

- (void).cxx_destruct
{
}

@end