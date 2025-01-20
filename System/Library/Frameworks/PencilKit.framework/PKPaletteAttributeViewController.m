@interface PKPaletteAttributeViewController
- (BOOL)didExperienceUserInteraction;
- (BOOL)didSendDismissStatistics;
- (NSString)toolIdentifier;
- (void)setDidExperienceUserInteraction:(BOOL)a3;
- (void)setDidSendDismissStatistics:(BOOL)a3;
- (void)setToolIdentifier:(id)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation PKPaletteAttributeViewController

- (void)viewWillAppear:(BOOL)a3
{
  BOOL v3 = a3;
  [(PKPaletteAttributeViewController *)self setDidExperienceUserInteraction:0];
  [(PKPaletteAttributeViewController *)self setDidSendDismissStatistics:0];
  v5.receiver = self;
  v5.super_class = (Class)PKPaletteAttributeViewController;
  [(PKPaletteAttributeViewController *)&v5 viewWillAppear:v3];
}

- (void)viewDidDisappear:(BOOL)a3
{
  v6.receiver = self;
  v6.super_class = (Class)PKPaletteAttributeViewController;
  [(PKPaletteAttributeViewController *)&v6 viewDidDisappear:a3];
  if (![(PKPaletteAttributeViewController *)self didSendDismissStatistics])
  {
    v4 = +[PKStatisticsManager sharedStatisticsManager]();
    objc_super v5 = [(PKPaletteAttributeViewController *)self toolIdentifier];
    [(PKPaletteAttributeViewController *)self didExperienceUserInteraction];
    -[PKStatisticsManager recordToolAttributePopoverAppearedForTool:hadInteraction:]((uint64_t)v4, v5);

    [(PKPaletteAttributeViewController *)self setDidSendDismissStatistics:1];
  }
}

- (BOOL)didExperienceUserInteraction
{
  return self->_didExperienceUserInteraction;
}

- (void)setDidExperienceUserInteraction:(BOOL)a3
{
  self->_didExperienceUserInteraction = a3;
}

- (NSString)toolIdentifier
{
  return self->_toolIdentifier;
}

- (void)setToolIdentifier:(id)a3
{
}

- (BOOL)didSendDismissStatistics
{
  return self->_didSendDismissStatistics;
}

- (void)setDidSendDismissStatistics:(BOOL)a3
{
  self->_didSendDismissStatistics = a3;
}

- (void).cxx_destruct
{
}

@end