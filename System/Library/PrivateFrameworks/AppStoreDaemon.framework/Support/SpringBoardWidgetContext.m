@interface SpringBoardWidgetContext
@end

@implementation SpringBoardWidgetContext

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pluginDenyList, 0);
  objc_storeStrong((id *)&self->_denyList, 0);
}

@end