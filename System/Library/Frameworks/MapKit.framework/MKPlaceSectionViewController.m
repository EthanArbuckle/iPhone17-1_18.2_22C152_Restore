@interface MKPlaceSectionViewController
- (BOOL)_viewHostsLayoutEngineAllowsTAMIC_NO;
- (MKPlaceSectionView)sectionView;
- (void)dealloc;
- (void)loadView;
- (void)stackViewNeedsLayout:(id)a3;
- (void)traitEnvironment:(id)a3 didChangeTraitCollection:(id)a4;
@end

@implementation MKPlaceSectionViewController

- (void)loadView
{
  v8[1] = *MEMORY[0x1E4F143B8];
  v3 = [MKPlaceSectionView alloc];
  v4 = -[MKPlaceSectionView initWithFrame:](v3, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  sectionView = self->_sectionView;
  self->_sectionView = v4;

  [(MKPlaceSectionView *)self->_sectionView setDelegate:self];
  [(_MKStackView *)self->_sectionView setStackAnimationDelegate:self];
  [(MKPlaceSectionViewController *)self setView:self->_sectionView];
  v8[0] = objc_opt_class();
  v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:1];
  id v7 = (id)[(MKPlaceSectionViewController *)self registerForTraitChanges:v6 withAction:sel_traitEnvironment_didChangeTraitCollection_];
}

- (void)dealloc
{
  [(MKPlaceSectionView *)self->_sectionView setDelegate:0];
  v3.receiver = self;
  v3.super_class = (Class)MKPlaceSectionViewController;
  [(MKPlaceSectionViewController *)&v3 dealloc];
}

- (MKPlaceSectionView)sectionView
{
  sectionView = self->_sectionView;
  if (!sectionView)
  {
    id v4 = (id)[(MKPlaceSectionViewController *)self view];
    sectionView = self->_sectionView;
  }

  return sectionView;
}

- (void)stackViewNeedsLayout:(id)a3
{
  id v4 = [(MKPlaceSectionViewController *)self parentViewController];
  objc_super v3 = [v4 view];
  objc_msgSend(v3, "_mapkit_layoutIfNeeded");
}

- (BOOL)_viewHostsLayoutEngineAllowsTAMIC_NO
{
  return 1;
}

- (void)traitEnvironment:(id)a3 didChangeTraitCollection:(id)a4
{
  uint64_t v5 = objc_msgSend(a4, "userInterfaceStyle", a3);
  v6 = [(MKPlaceSectionViewController *)self traitCollection];
  uint64_t v7 = [v6 userInterfaceStyle];

  if (v5 != v7 && (objc_opt_respondsToSelector() & 1) != 0)
  {
    [(UIViewController *)self infoCardThemeChanged];
  }
}

- (void).cxx_destruct
{
}

@end