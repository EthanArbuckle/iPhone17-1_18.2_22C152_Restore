@interface SoundActionsPracticeNavigationController
- (NSURL)assetURL;
- (SoundActionsLearnMoreViewController)learnMoreViewController;
- (SoundActionsPracticeNavigationController)initWithAssetURL:(id)a3;
- (SoundActionsPracticeNavigationController)initWithAssetURL:(id)a3 usage:(int64_t)a4;
- (SoundActionsPracticeViewController)practiceViewController;
- (int64_t)usage;
- (void)_doneTapped:(id)a3;
- (void)_setupLearnMoreViewControllerWithData:(id)a3;
- (void)_setupPracticeViewController;
- (void)setAssetURL:(id)a3;
- (void)setLearnMoreViewController:(id)a3;
- (void)setPracticeViewController:(id)a3;
- (void)setUsage:(int64_t)a3;
- (void)viewDidLoad;
@end

@implementation SoundActionsPracticeNavigationController

- (SoundActionsPracticeNavigationController)initWithAssetURL:(id)a3
{
  return [(SoundActionsPracticeNavigationController *)self initWithAssetURL:a3 usage:0];
}

- (SoundActionsPracticeNavigationController)initWithAssetURL:(id)a3 usage:(int64_t)a4
{
  id v6 = a3;
  v10.receiver = self;
  v10.super_class = (Class)SoundActionsPracticeNavigationController;
  v7 = [(SoundActionsPracticeNavigationController *)&v10 init];
  v8 = v7;
  if (v7)
  {
    [(SoundActionsPracticeNavigationController *)v7 setAssetURL:v6];
    [(SoundActionsPracticeNavigationController *)v8 setUsage:a4];
  }

  return v8;
}

- (void)viewDidLoad
{
  v8.receiver = self;
  v8.super_class = (Class)SoundActionsPracticeNavigationController;
  [(SoundActionsPracticeNavigationController *)&v8 viewDidLoad];
  if ([(SoundActionsPracticeNavigationController *)self usage])
  {
    v3 = +[SoundActionsPracticeUtilities sharedInstance];
    int64_t v4 = [(SoundActionsPracticeNavigationController *)self usage];
    v5 = [(SoundActionsPracticeNavigationController *)self assetURL];
    id v6 = [v3 dataForSoundUsage:v4 assetURL:v5];

    [(SoundActionsPracticeNavigationController *)self _setupLearnMoreViewControllerWithData:v6];
    v7 = [(SoundActionsPracticeNavigationController *)self learnMoreViewController];
    [(SoundActionsPracticeNavigationController *)self pushViewController:v7 animated:0];
  }
  else
  {
    [(SoundActionsPracticeNavigationController *)self _setupPracticeViewController];
    id v6 = [(SoundActionsPracticeNavigationController *)self practiceViewController];
    [(SoundActionsPracticeNavigationController *)self pushViewController:v6 animated:0];
  }
}

- (void)setAssetURL:(id)a3
{
  id v4 = a3;
  v5 = (NSURL *)[v4 copy];
  assetURL = self->_assetURL;
  self->_assetURL = v5;

  id v8 = [v4 copy];
  v7 = [(SoundActionsPracticeNavigationController *)self practiceViewController];
  [v7 setAssetURL:v8];
}

- (void)_setupLearnMoreViewControllerWithData:(id)a3
{
  id v4 = a3;
  v5 = [(SoundActionsPracticeNavigationController *)self learnMoreViewController];

  if (!v5)
  {
    id v6 = [SoundActionsLearnMoreViewController alloc];
    v7 = settingsLocString(@"SOUND_ACTION_LEARN_PAGE_TITLE", @"Accessibility");
    id v8 = settingsLocString(@"SOUND_ACTION_LEARN_PAGE_DETAIL", @"Accessibility");
    v9 = [(SoundActionsLearnMoreViewController *)v6 initWithTitle:v7 detailText:v8 icon:0];
    [(SoundActionsPracticeNavigationController *)self setLearnMoreViewController:v9];

    id v15 = v4;
    objc_super v10 = +[NSArray arrayWithObjects:&v15 count:1];
    v11 = [(SoundActionsPracticeNavigationController *)self learnMoreViewController];
    [v11 setSounds:v10];
  }
  id v12 = [objc_alloc((Class)UIBarButtonItem) initWithBarButtonSystemItem:0 target:self action:"_doneTapped:"];
  v13 = [(SoundActionsPracticeNavigationController *)self learnMoreViewController];
  v14 = [v13 navigationItem];
  [v14 setRightBarButtonItem:v12];
}

- (void)_setupPracticeViewController
{
  v3 = [(SoundActionsPracticeNavigationController *)self practiceViewController];

  if (!v3)
  {
    id v4 = [SoundActionsPracticeViewController alloc];
    v5 = settingsLocString(@"SOUND_ACTION_PRACTICE_PAGE_TITLE", @"Accessibility");
    id v6 = settingsLocString(@"SOUND_ACTION_PRACTICE_PAGE_DETAIL", @"Accessibility");
    v7 = [(SoundActionsPracticeViewController *)v4 initWithTitle:v5 detailText:v6 icon:0 contentLayout:3];
    [(SoundActionsPracticeNavigationController *)self setPracticeViewController:v7];

    id v8 = [(SoundActionsPracticeNavigationController *)self assetURL];
    id v9 = [v8 copy];
    objc_super v10 = [(SoundActionsPracticeNavigationController *)self practiceViewController];
    [v10 setAssetURL:v9];
  }
  id v13 = [objc_alloc((Class)UIBarButtonItem) initWithBarButtonSystemItem:0 target:self action:"_doneTapped:"];
  v11 = [(SoundActionsPracticeNavigationController *)self practiceViewController];
  id v12 = [v11 navigationItem];
  [v12 setRightBarButtonItem:v13];
}

- (void)_doneTapped:(id)a3
{
}

- (NSURL)assetURL
{
  return self->_assetURL;
}

- (SoundActionsPracticeViewController)practiceViewController
{
  return self->_practiceViewController;
}

- (void)setPracticeViewController:(id)a3
{
}

- (SoundActionsLearnMoreViewController)learnMoreViewController
{
  return self->_learnMoreViewController;
}

- (void)setLearnMoreViewController:(id)a3
{
}

- (int64_t)usage
{
  return self->_usage;
}

- (void)setUsage:(int64_t)a3
{
  self->_usage = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_learnMoreViewController, 0);
  objc_storeStrong((id *)&self->_practiceViewController, 0);

  objc_storeStrong((id *)&self->_assetURL, 0);
}

@end