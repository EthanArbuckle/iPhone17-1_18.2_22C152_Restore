@interface CKSyndicationContentViewController
- (CAGradientLayer)gradientLayer;
- (CGSize)maxContentSize;
- (CKSyndicationContentViewController)initWithIndex:(unint64_t)a3;
- (CKSyndicationSharedWithYouViewController)sharedWithYouViewController;
- (NSMutableArray)constraints;
- (UILabel)micropillView1;
- (UILabel)micropillView2;
- (UIView)combinedHighlightsView;
- (UIView)gradientView;
- (UIView)highlightsView1;
- (UIView)highlightsView2;
- (UIView)musicLinkBalloonView;
- (UIView)podcastLinkBalloonView;
- (UIView)podcastPinIconView;
- (UIView)tvLinkBalloonView;
- (UIView)tvPinIconView;
- (double)photoLongSide;
- (double)photoShortSide;
- (id)_setUpPhotosMicropillForAvatarImage:(id)a3 forName:(id)a4;
- (id)getPinIcon;
- (unint64_t)onboardingPage;
- (void)loadView;
- (void)setCombinedHighlightsView:(id)a3;
- (void)setConstraints:(id)a3;
- (void)setGradientLayer:(id)a3;
- (void)setGradientView:(id)a3;
- (void)setHighlightsView1:(id)a3;
- (void)setHighlightsView2:(id)a3;
- (void)setMaxContentSize:(CGSize)a3;
- (void)setMicropillView1:(id)a3;
- (void)setMicropillView2:(id)a3;
- (void)setMusicLinkBalloonView:(id)a3;
- (void)setOnboardingPage:(unint64_t)a3;
- (void)setPhotoLongSide:(double)a3;
- (void)setPhotoShortSide:(double)a3;
- (void)setPodcastLinkBalloonView:(id)a3;
- (void)setPodcastPinIconView:(id)a3;
- (void)setSharedWithYouViewController:(id)a3;
- (void)setTvLinkBalloonView:(id)a3;
- (void)setTvPinIconView:(id)a3;
- (void)setUpHighlightsContent;
- (void)setUpPhotosContent;
- (void)setUpSharedWithYouContentCollectionView;
- (void)traitCollectionDidChange:(id)a3;
- (void)updateMaxContentSize;
- (void)updateViewConstraints;
- (void)viewDidLayoutSubviews;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
@end

@implementation CKSyndicationContentViewController

- (CKSyndicationContentViewController)initWithIndex:(unint64_t)a3
{
  v4 = self;
  -[CKSyndicationContentViewController setOnboardingPage:](self, "setOnboardingPage:");
  switch(a3)
  {
    case 2uLL:
      v10 = CKFrameworkBundle();
      v6 = [v10 localizedStringForKey:@"WHATS_NEW_SYNDICATION_PINS_DETAIL_TITLE" value:&stru_1EDE4CA38 table:@"ChatKit"];

      v11 = CKFrameworkBundle();
      v8 = [v11 localizedStringForKey:@"WHATS_NEW_SYNDICATION_PINS_DETAIL_DESCRIPTION" value:&stru_1EDE4CA38 table:@"ChatKit"];

      v9 = -[CKSyndicationContentViewController initWithTitle:detailText:icon:](&v15, sel_initWithTitle_detailText_icon_, v6, v8, 0, v4, CKSyndicationContentViewController, v16.receiver, v16.super_class, v17.receiver, v17.super_class);
LABEL_9:
      v4 = v9;

      return v4;
    case 1uLL:
      v12 = CKFrameworkBundle();
      v6 = [v12 localizedStringForKey:@"WHATS_NEW_SYNDICATION_PHOTOS_DETAIL_TITLE" value:&stru_1EDE4CA38 table:@"ChatKit"];

      v13 = CKFrameworkBundle();
      v8 = [v13 localizedStringForKey:@"WHATS_NEW_SYNDICATION_PHOTOS_DETAIL_DESCRIPTION" value:&stru_1EDE4CA38 table:@"ChatKit"];

      v9 = -[CKSyndicationContentViewController initWithTitle:detailText:icon:](&v16, sel_initWithTitle_detailText_icon_, v6, v8, 0, v15.receiver, v15.super_class, v4, CKSyndicationContentViewController, v17.receiver, v17.super_class);
      goto LABEL_9;
    case 0uLL:
      v5 = CKFrameworkBundle();
      v6 = [v5 localizedStringForKey:@"WHATS_NEW_SYNDICATION_DETAIL_TITLE" value:&stru_1EDE4CA38 table:@"ChatKit"];

      v7 = CKFrameworkBundle();
      v8 = [v7 localizedStringForKey:@"WHATS_NEW_SYNDICATION_DETAIL_DESCRIPTION" value:&stru_1EDE4CA38 table:@"ChatKit"];

      if ([(__CFString *)v8 isEqualToString:@"WHATS_NEW_SYNDICATION_DETAIL_DESCRIPTION_MAC"])
      {

        v8 = @"Content shared in Messages can automatically appear in apps such as Photos, Safari, and more.";
      }
      v9 = -[CKSyndicationContentViewController initWithTitle:detailText:icon:](&v17, sel_initWithTitle_detailText_icon_, v6, v8, 0, v15.receiver, v15.super_class, v16.receiver, v16.super_class, v4, CKSyndicationContentViewController);
      goto LABEL_9;
  }
  return v4;
}

- (void)loadView
{
  v4.receiver = self;
  v4.super_class = (Class)CKSyndicationContentViewController;
  [(OBBaseWelcomeController *)&v4 loadView];
  unint64_t v3 = [(CKSyndicationContentViewController *)self onboardingPage];
  switch(v3)
  {
    case 2uLL:
      [(CKSyndicationContentViewController *)self setUpHighlightsContent];
      break;
    case 1uLL:
      [(CKSyndicationContentViewController *)self setUpPhotosContent];
      break;
    case 0uLL:
      [(CKSyndicationContentViewController *)self setUpSharedWithYouContentCollectionView];
      break;
  }
}

- (void)viewDidLayoutSubviews
{
  v48.receiver = self;
  v48.super_class = (Class)CKSyndicationContentViewController;
  [(OBBaseWelcomeController *)&v48 viewDidLayoutSubviews];
  [(CKSyndicationContentViewController *)self updateMaxContentSize];
  unint64_t v3 = [(CKSyndicationContentViewController *)self micropillView1];
  [v3 frame];
  double v5 = v4 * 0.5;
  v6 = [(CKSyndicationContentViewController *)self micropillView1];
  v7 = [v6 layer];
  [v7 setCornerRadius:v5];

  v8 = [(CKSyndicationContentViewController *)self micropillView2];
  [v8 frame];
  double v10 = v9 * 0.5;
  v11 = [(CKSyndicationContentViewController *)self micropillView2];
  v12 = [v11 layer];
  [v12 setCornerRadius:v10];

  v13 = [(CKSyndicationContentViewController *)self tvPinIconView];
  [v13 frame];
  double v15 = v14 * 0.5;
  objc_super v16 = [(CKSyndicationContentViewController *)self tvPinIconView];
  objc_super v17 = [v16 layer];
  [v17 setCornerRadius:v15];

  v18 = [(CKSyndicationContentViewController *)self podcastPinIconView];
  [v18 frame];
  double v20 = v19 * 0.5;
  v21 = [(CKSyndicationContentViewController *)self podcastPinIconView];
  v22 = [v21 layer];
  [v22 setCornerRadius:v20];

  v23 = +[CKUIBehavior sharedBehaviors];
  [v23 messageHighlightTranscriptBalloonBorderWidth];
  double v25 = v24;

  v26 = [(CKSyndicationContentViewController *)self tvPinIconView];
  v27 = [v26 layer];
  [v27 setBorderWidth:v25];

  v28 = [(CKSyndicationContentViewController *)self podcastPinIconView];
  v29 = [v28 layer];
  [v29 setBorderWidth:v25];

  id v30 = [MEMORY[0x1E4F428B8] systemBackgroundColor];
  uint64_t v31 = [v30 CGColor];
  v32 = [(CKSyndicationContentViewController *)self tvPinIconView];
  v33 = [v32 layer];
  [v33 setBorderColor:v31];

  id v34 = [MEMORY[0x1E4F428B8] systemBackgroundColor];
  uint64_t v35 = [v34 CGColor];
  v36 = [(CKSyndicationContentViewController *)self podcastPinIconView];
  v37 = [v36 layer];
  [v37 setBorderColor:v35];

  v38 = [(CKSyndicationContentViewController *)self podcastLinkBalloonView];
  [v38 bounds];
  double v40 = v39;
  double v42 = v41;
  double v44 = v43;
  double v46 = v45;
  v47 = [(CKSyndicationContentViewController *)self gradientLayer];
  objc_msgSend(v47, "setFrame:", v40, v42, v44, v46);
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __89__CKSyndicationContentViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke;
  v4[3] = &unk_1E5621550;
  v4[4] = self;
  [a4 animateAlongsideTransition:v4 completion:0];
}

uint64_t __89__CKSyndicationContentViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) updateMaxContentSize];
}

- (void)updateMaxContentSize
{
  unint64_t v3 = [(CKSyndicationContentViewController *)self headerView];
  [v3 origin];
  double v5 = v4;
  v6 = [(CKSyndicationContentViewController *)self headerView];
  [v6 bounds];
  double v8 = v5 + v7;

  double v9 = [(CKSyndicationContentViewController *)self view];
  [v9 bounds];
  double v11 = v10 - v8;

  v12 = [(CKSyndicationContentViewController *)self view];
  [v12 bounds];
  double v14 = v13;

  -[CKSyndicationContentViewController setMaxContentSize:](self, "setMaxContentSize:", v14, v11);
  if (!CKIsRunningInMacCatalyst())
  {
    double v15 = [MEMORY[0x1E4F42D90] mainScreen];
    [v15 bounds];
    double v14 = v16;

    objc_super v17 = [MEMORY[0x1E4F42D90] mainScreen];
    [v17 bounds];
    double v19 = v18;

    double v11 = v14 > v19 ? v14 : v19;
    if (v14 > v19) {
      double v14 = v19;
    }
  }
  id v20 = [(CKSyndicationContentViewController *)self sharedWithYouViewController];
  objc_msgSend(v20, "setMaxContentSize:", v14, v11);
}

- (void)setMaxContentSize:(CGSize)a3
{
  if (a3.width != self->_maxContentSize.width || a3.height != self->_maxContentSize.height)
  {
    self->_maxContentSize = a3;
    id v4 = [(CKSyndicationContentViewController *)self view];
    [v4 setNeedsUpdateConstraints];
  }
}

- (void)updateViewConstraints
{
  v290[2] = *MEMORY[0x1E4F143B8];
  unint64_t v3 = [(CKSyndicationContentViewController *)self constraints];
  uint64_t v4 = [v3 count];

  unint64_t v5 = 0x1E4F28000uLL;
  if (v4)
  {
    v6 = (void *)MEMORY[0x1E4F28DC8];
    double v7 = [(CKSyndicationContentViewController *)self constraints];
    [v6 deactivateConstraints:v7];
  }
  double v8 = [MEMORY[0x1E4F1CA48] array];
  [(CKSyndicationContentViewController *)self setConstraints:v8];

  double v9 = [(CKSyndicationContentViewController *)self contentView];
  [(CKSyndicationContentViewController *)self maxContentSize];
  double v11 = v10;
  double v12 = v10 * 0.5;
  double v13 = [(CKSyndicationContentViewController *)self traitCollection];
  [v13 displayScale];
  [(CKSyndicationContentViewController *)self setPhotoLongSide:round(v12 * v14) / v14];

  double v15 = [(CKSyndicationContentViewController *)self traitCollection];
  [v15 displayScale];
  [(CKSyndicationContentViewController *)self setPhotoShortSide:round(v12 * 0.8 * v16) / v16];

  objc_super v17 = [(CKSyndicationContentViewController *)self view];
  [v17 bounds];
  double v19 = v18;

  [(CKSyndicationContentViewController *)self photoShortSide];
  double v21 = v20;
  [(CKSyndicationContentViewController *)self maxContentSize];
  if (v21 >= v22 * 0.25)
  {
    double v29 = v19 / 15.0;
  }
  else
  {
    v23 = [(CKSyndicationContentViewController *)self traitCollection];
    [v23 displayScale];
    [(CKSyndicationContentViewController *)self setPhotoLongSide:round(v11 * 0.6 * v24) / v24];

    double v25 = [(CKSyndicationContentViewController *)self traitCollection];
    [v25 displayScale];
    [(CKSyndicationContentViewController *)self setPhotoShortSide:round(v11 * 0.6 * 0.8 * v26) / v26];

    v27 = [(CKSyndicationContentViewController *)self view];
    [v27 bounds];
    double v29 = v28 * 0.125;
  }
  if (IMSharedHelperDeviceIsiPad() && !CKIsRunningInMacCatalyst())
  {
    id v30 = [(CKSyndicationContentViewController *)self traitCollection];
    [v30 displayScale];
    [(CKSyndicationContentViewController *)self setPhotoLongSide:round(v11 * 0.6 * v31) / v31];

    v32 = [(CKSyndicationContentViewController *)self traitCollection];
    [v32 displayScale];
    [(CKSyndicationContentViewController *)self setPhotoShortSide:round(v11 * 0.6 * 0.8 * v33) / v33];

    id v34 = [(CKSyndicationContentViewController *)self view];
    [v34 bounds];
    double v29 = v35 / 12.0;
  }
  [(CKSyndicationContentViewController *)self maxContentSize];
  double v37 = v36 * 1.2;
  [(CKSyndicationContentViewController *)self maxContentSize];
  double v39 = v38;
  BOOL v40 = v37 < v38;
  if (IMSharedHelperDeviceIsiPad() && !CKIsRunningInMacCatalyst())
  {
    double v41 = 0.4;
    double v42 = 0.3;
    double v43 = 0.12;
  }
  else if (CKIsRunningInMacCatalyst())
  {
    double v41 = 0.5;
    double v42 = 0.35;
    double v43 = 0.15;
  }
  else
  {
    double v43 = dbl_18F81D260[v40];
    double v42 = dbl_18F81D270[v40];
    double v41 = dbl_18F81D280[v40];
  }
  unint64_t v44 = [(CKSyndicationContentViewController *)self onboardingPage];
  if (v44 == 2)
  {
    v259 = v9;
    if (v37 >= v39 || (IMSharedHelperDeviceIsiPad() & 1) != 0)
    {
      v275 = [(CKSyndicationContentViewController *)self constraints];
      v283 = [(CKSyndicationContentViewController *)self tvLinkBalloonView];
      v272 = [v283 widthAnchor];
      v266 = [(CKSyndicationContentViewController *)self view];
      uint64_t v269 = [v266 widthAnchor];
      uint64_t v278 = [v272 constraintEqualToAnchor:v269 multiplier:v41];
      v287[0] = v278;
      v263 = [(CKSyndicationContentViewController *)self tvLinkBalloonView];
      v55 = [v263 heightAnchor];
      v284 = [(CKSyndicationContentViewController *)self view];
      uint64_t v260 = [v284 widthAnchor];
      v285 = v55;
      v282 = [v55 constraintEqualToAnchor:v260 multiplier:v42];
      v287[1] = v282;
      v281 = [(CKSyndicationContentViewController *)self podcastLinkBalloonView];
      v255 = [v281 widthAnchor];
      v257 = [(CKSyndicationContentViewController *)self view];
      v253 = [v257 widthAnchor];
      v251 = [v255 constraintEqualToAnchor:v253 multiplier:v41];
      v287[2] = v251;
      v249 = [(CKSyndicationContentViewController *)self podcastLinkBalloonView];
      v245 = [v249 heightAnchor];
      v247 = [(CKSyndicationContentViewController *)self view];
      v243 = [v247 widthAnchor];
      v241 = [v245 constraintEqualToAnchor:v243 multiplier:v43];
      v287[3] = v241;
      v239 = [(CKSyndicationContentViewController *)self musicLinkBalloonView];
      v235 = [v239 widthAnchor];
      v237 = [(CKSyndicationContentViewController *)self view];
      v233 = [v237 widthAnchor];
      v231 = [v235 constraintEqualToAnchor:v233 multiplier:v41];
      v287[4] = v231;
      v229 = [(CKSyndicationContentViewController *)self musicLinkBalloonView];
      v225 = [v229 heightAnchor];
      v227 = [(CKSyndicationContentViewController *)self view];
      v223 = [v227 widthAnchor];
      v221 = [v225 constraintEqualToAnchor:v223 multiplier:v43];
      v287[5] = v221;
      v219 = [(CKSyndicationContentViewController *)self gradientView];
      v213 = [v219 widthAnchor];
      v216 = [(CKSyndicationContentViewController *)self view];
      v210 = [v216 widthAnchor];
      v207 = [v213 constraintEqualToAnchor:v210 multiplier:v41];
      v287[6] = v207;
      v204 = [(CKSyndicationContentViewController *)self gradientView];
      v198 = [v204 heightAnchor];
      v201 = [(CKSyndicationContentViewController *)self view];
      v195 = [v201 widthAnchor];
      v192 = [v198 constraintEqualToAnchor:v195 multiplier:v43];
      v287[7] = v192;
      v189 = [(CKSyndicationContentViewController *)self tvLinkBalloonView];
      v186 = [v189 topAnchor];
      v183 = [v9 topAnchor];
      v180 = [v186 constraintEqualToAnchor:v183];
      v287[8] = v180;
      v177 = [(CKSyndicationContentViewController *)self podcastLinkBalloonView];
      v171 = [v177 topAnchor];
      v174 = [(CKSyndicationContentViewController *)self tvLinkBalloonView];
      v168 = [v174 bottomAnchor];
      v165 = [v171 constraintEqualToAnchor:v168 constant:10.0];
      v287[9] = v165;
      v162 = [(CKSyndicationContentViewController *)self musicLinkBalloonView];
      v156 = [v162 topAnchor];
      v159 = [(CKSyndicationContentViewController *)self podcastLinkBalloonView];
      v153 = [v159 bottomAnchor];
      v150 = [v156 constraintEqualToAnchor:v153 constant:10.0];
      v287[10] = v150;
      v148 = [(CKSyndicationContentViewController *)self tvLinkBalloonView];
      v146 = [v148 centerXAnchor];
      v144 = [v9 centerXAnchor];
      v142 = [v146 constraintEqualToAnchor:v144];
      v287[11] = v142;
      v140 = [(CKSyndicationContentViewController *)self podcastLinkBalloonView];
      v138 = [v140 centerXAnchor];
      v136 = [v9 centerXAnchor];
      v134 = [v138 constraintEqualToAnchor:v136];
      v287[12] = v134;
      v132 = [(CKSyndicationContentViewController *)self musicLinkBalloonView];
      v130 = [v132 centerXAnchor];
      v128 = [v9 centerXAnchor];
      v127 = [v130 constraintEqualToAnchor:v128];
      v287[13] = v127;
      v126 = [(CKSyndicationContentViewController *)self gradientView];
      v124 = [v126 topAnchor];
      v125 = [(CKSyndicationContentViewController *)self podcastLinkBalloonView];
      v123 = [v125 bottomAnchor];
      v122 = [v124 constraintEqualToAnchor:v123 constant:10.0];
      v287[14] = v122;
      v121 = [(CKSyndicationContentViewController *)self gradientView];
      v120 = [v121 centerXAnchor];
      v119 = [v9 centerXAnchor];
      v118 = [v120 constraintEqualToAnchor:v119];
      v287[15] = v118;
      v117 = [(CKSyndicationContentViewController *)self tvPinIconView];
      v115 = [v117 topAnchor];
      v116 = [(CKSyndicationContentViewController *)self tvLinkBalloonView];
      v114 = [v116 bottomAnchor];
      v113 = [v115 constraintEqualToAnchor:v114 constant:-11.0];
      v287[16] = v113;
      v112 = [(CKSyndicationContentViewController *)self tvPinIconView];
      v110 = [v112 leadingAnchor];
      v111 = [(CKSyndicationContentViewController *)self tvLinkBalloonView];
      v109 = [v111 trailingAnchor];
      v108 = [v110 constraintEqualToAnchor:v109 constant:-11.0];
      v287[17] = v108;
      v107 = [(CKSyndicationContentViewController *)self tvPinIconView];
      v106 = [v107 widthAnchor];
      v105 = [v106 constraintEqualToConstant:22.0];
      v287[18] = v105;
      v104 = [(CKSyndicationContentViewController *)self tvPinIconView];
      v103 = [v104 heightAnchor];
      v102 = [v103 constraintEqualToConstant:22.0];
      v287[19] = v102;
      v101 = [(CKSyndicationContentViewController *)self podcastPinIconView];
      v99 = [v101 topAnchor];
      v100 = [(CKSyndicationContentViewController *)self podcastLinkBalloonView];
      v98 = [v100 bottomAnchor];
      v97 = [v99 constraintEqualToAnchor:v98 constant:-11.0];
      v287[20] = v97;
      v96 = [(CKSyndicationContentViewController *)self podcastPinIconView];
      v94 = [v96 leadingAnchor];
      v95 = [(CKSyndicationContentViewController *)self podcastLinkBalloonView];
      v93 = [v95 trailingAnchor];
      v56 = [v94 constraintEqualToAnchor:v93 constant:-11.0];
      v287[21] = v56;
      v57 = [(CKSyndicationContentViewController *)self podcastPinIconView];
      v58 = [v57 widthAnchor];
      v59 = [v58 constraintEqualToConstant:22.0];
      v287[22] = v59;
      v60 = [(CKSyndicationContentViewController *)self podcastPinIconView];
      v61 = [v60 heightAnchor];
      v62 = [v61 constraintEqualToConstant:22.0];
      v287[23] = v62;
      v63 = [MEMORY[0x1E4F1C978] arrayWithObjects:v287 count:24];
      double v45 = v275;
      [v275 addObjectsFromArray:v63];

      v47 = v266;
      v54 = (void *)v260;

      v50 = v263;
      objc_super v48 = (void *)v269;

      double v46 = v272;
      double v9 = v259;

      v49 = (void *)v278;
      v64 = v213;
    }
    else
    {
      v79 = [(CKSyndicationContentViewController *)self podcastPinIconView];
      [v79 removeFromSuperview];

      v277 = [(CKSyndicationContentViewController *)self constraints];
      v283 = [(CKSyndicationContentViewController *)self tvLinkBalloonView];
      v274 = [v283 widthAnchor];
      v268 = [(CKSyndicationContentViewController *)self view];
      uint64_t v271 = [v268 widthAnchor];
      uint64_t v280 = [v274 constraintEqualToAnchor:v271 multiplier:v41];
      v288[0] = v280;
      v265 = [(CKSyndicationContentViewController *)self tvLinkBalloonView];
      v80 = [v265 heightAnchor];
      v284 = [(CKSyndicationContentViewController *)self view];
      uint64_t v262 = [v284 widthAnchor];
      v285 = v80;
      v282 = [v80 constraintEqualToAnchor:v262 multiplier:v42];
      v288[1] = v282;
      v281 = [(CKSyndicationContentViewController *)self podcastLinkBalloonView];
      v255 = [v281 widthAnchor];
      v257 = [(CKSyndicationContentViewController *)self view];
      v253 = [v257 widthAnchor];
      v251 = [v255 constraintEqualToAnchor:v253 multiplier:v41];
      v288[2] = v251;
      v249 = [(CKSyndicationContentViewController *)self podcastLinkBalloonView];
      v245 = [v249 heightAnchor];
      v247 = [(CKSyndicationContentViewController *)self view];
      v243 = [v247 widthAnchor];
      v241 = [v245 constraintEqualToAnchor:v243 multiplier:v43];
      v288[3] = v241;
      v239 = [(CKSyndicationContentViewController *)self gradientView];
      v235 = [v239 widthAnchor];
      v237 = [(CKSyndicationContentViewController *)self view];
      v233 = [v237 widthAnchor];
      v231 = [v235 constraintEqualToAnchor:v233 multiplier:v41];
      v288[4] = v231;
      v229 = [(CKSyndicationContentViewController *)self gradientView];
      v225 = [v229 heightAnchor];
      v227 = [(CKSyndicationContentViewController *)self view];
      v223 = [v227 widthAnchor];
      v221 = [v225 constraintEqualToAnchor:v223 multiplier:v43];
      v288[5] = v221;
      v219 = [(CKSyndicationContentViewController *)self tvLinkBalloonView];
      v218 = [v219 topAnchor];
      v215 = [v9 topAnchor];
      v212 = [v218 constraintEqualToAnchor:v215];
      v288[6] = v212;
      v209 = [(CKSyndicationContentViewController *)self podcastLinkBalloonView];
      v203 = [v209 topAnchor];
      v206 = [(CKSyndicationContentViewController *)self tvLinkBalloonView];
      v200 = [v206 bottomAnchor];
      v197 = [v203 constraintEqualToAnchor:v200 constant:10.0];
      v288[7] = v197;
      v194 = [(CKSyndicationContentViewController *)self tvLinkBalloonView];
      v191 = [v194 centerXAnchor];
      v188 = [v9 centerXAnchor];
      v185 = [v191 constraintEqualToAnchor:v188];
      v288[8] = v185;
      v182 = [(CKSyndicationContentViewController *)self podcastLinkBalloonView];
      v179 = [v182 centerXAnchor];
      v176 = [v9 centerXAnchor];
      v173 = [v179 constraintEqualToAnchor:v176];
      v288[9] = v173;
      v170 = [(CKSyndicationContentViewController *)self gradientView];
      v164 = [v170 topAnchor];
      v167 = [(CKSyndicationContentViewController *)self tvLinkBalloonView];
      v161 = [v167 bottomAnchor];
      v158 = [v164 constraintEqualToAnchor:v161 constant:10.0];
      v288[10] = v158;
      v155 = [(CKSyndicationContentViewController *)self gradientView];
      v152 = [v155 centerXAnchor];
      v149 = [v9 centerXAnchor];
      v147 = [v152 constraintEqualToAnchor:v149];
      v288[11] = v147;
      v145 = [(CKSyndicationContentViewController *)self tvPinIconView];
      v141 = [v145 topAnchor];
      v143 = [(CKSyndicationContentViewController *)self tvLinkBalloonView];
      v139 = [v143 bottomAnchor];
      v137 = [v141 constraintEqualToAnchor:v139 constant:-11.0];
      v288[12] = v137;
      v135 = [(CKSyndicationContentViewController *)self tvPinIconView];
      v131 = [v135 leadingAnchor];
      v133 = [(CKSyndicationContentViewController *)self tvLinkBalloonView];
      v129 = [v133 trailingAnchor];
      v81 = [v131 constraintEqualToAnchor:v129 constant:-11.0];
      v288[13] = v81;
      v82 = [(CKSyndicationContentViewController *)self tvPinIconView];
      v83 = [v82 widthAnchor];
      v84 = [v83 constraintEqualToConstant:22.0];
      v288[14] = v84;
      v85 = [(CKSyndicationContentViewController *)self tvPinIconView];
      v86 = [v85 heightAnchor];
      v87 = [v86 constraintEqualToConstant:22.0];
      v288[15] = v87;
      v88 = [MEMORY[0x1E4F1C978] arrayWithObjects:v288 count:16];
      double v45 = v277;
      [v277 addObjectsFromArray:v88];

      v54 = (void *)v262;
      v50 = v265;

      objc_super v48 = (void *)v271;
      v49 = (void *)v280;

      double v46 = v274;
      double v9 = v259;

      v47 = v268;
      v64 = v218;
    }

    unint64_t v5 = 0x1E4F28000uLL;
  }
  else if (v44 == 1)
  {
    v276 = [(CKSyndicationContentViewController *)self constraints];
    v283 = [(CKSyndicationContentViewController *)self highlightsView1];
    v273 = [v283 topAnchor];
    uint64_t v267 = [v9 topAnchor];
    uint64_t v270 = [v273 constraintEqualToAnchor:v267 constant:20.0];
    v289[0] = v270;
    v279 = [(CKSyndicationContentViewController *)self highlightsView1];
    v264 = [v279 leadingAnchor];
    v285 = [v9 leadingAnchor];
    v284 = objc_msgSend(v264, "constraintEqualToAnchor:constant:", v29);
    v289[1] = v284;
    v261 = [(CKSyndicationContentViewController *)self highlightsView1];
    v65 = [v261 widthAnchor];
    [(CKSyndicationContentViewController *)self photoLongSide];
    v282 = v65;
    v281 = objc_msgSend(v65, "constraintEqualToConstant:");
    v289[2] = v281;
    v258 = [(CKSyndicationContentViewController *)self highlightsView1];
    v256 = [v258 heightAnchor];
    [(CKSyndicationContentViewController *)self photoShortSide];
    v254 = objc_msgSend(v256, "constraintEqualToConstant:");
    v289[3] = v254;
    v252 = [(CKSyndicationContentViewController *)self highlightsView2];
    v250 = [v252 topAnchor];
    v248 = [v9 topAnchor];
    v246 = [v250 constraintEqualToAnchor:v248 constant:v11 * 0.1 + 20.0];
    v289[4] = v246;
    v244 = [(CKSyndicationContentViewController *)self highlightsView2];
    v242 = [v244 trailingAnchor];
    v240 = [v9 trailingAnchor];
    v238 = [v242 constraintEqualToAnchor:v240 constant:-v29];
    v289[5] = v238;
    v236 = [(CKSyndicationContentViewController *)self highlightsView2];
    v234 = [v236 widthAnchor];
    [(CKSyndicationContentViewController *)self photoShortSide];
    v232 = objc_msgSend(v234, "constraintEqualToConstant:");
    v289[6] = v232;
    v230 = [(CKSyndicationContentViewController *)self highlightsView2];
    v228 = [v230 heightAnchor];
    [(CKSyndicationContentViewController *)self photoLongSide];
    v226 = objc_msgSend(v228, "constraintEqualToConstant:");
    v289[7] = v226;
    v224 = [(CKSyndicationContentViewController *)self micropillView1];
    v222 = [v224 topAnchor];
    v220 = [v9 topAnchor];
    v217 = [v222 constraintEqualToAnchor:v220 constant:7.5];
    v289[8] = v217;
    v214 = [(CKSyndicationContentViewController *)self micropillView1];
    v211 = [v214 leadingAnchor];
    v208 = [v9 leadingAnchor];
    [(CKSyndicationContentViewController *)self photoLongSide];
    v205 = [v211 constraintEqualToAnchor:v208 constant:v29 + v66 + -132.0];
    v289[9] = v205;
    v202 = [(CKSyndicationContentViewController *)self micropillView1];
    v199 = [v202 widthAnchor];
    [(CKSyndicationContentViewController *)self maxContentSize];
    v196 = [v199 constraintLessThanOrEqualToConstant:v67 - v29];
    v289[10] = v196;
    v193 = [(CKSyndicationContentViewController *)self micropillView1];
    v190 = [v193 heightAnchor];
    v187 = [v190 constraintEqualToConstant:25.0];
    v289[11] = v187;
    v184 = [(CKSyndicationContentViewController *)self micropillView2];
    v181 = [v184 topAnchor];
    v178 = [v9 topAnchor];
    [(CKSyndicationContentViewController *)self photoLongSide];
    v175 = [v181 constraintEqualToAnchor:v178 constant:v68 + 20.0 + v11 * 0.1 + -12.5];
    v289[12] = v175;
    v172 = [(CKSyndicationContentViewController *)self micropillView2];
    v169 = [v172 trailingAnchor];
    v166 = [v9 trailingAnchor];
    [(CKSyndicationContentViewController *)self photoShortSide];
    v163 = [v169 constraintEqualToAnchor:v166 constant:-v29 - v69 + 132.0];
    v289[13] = v163;
    v160 = [(CKSyndicationContentViewController *)self micropillView2];
    v157 = [v160 bottomAnchor];
    v154 = [v9 bottomAnchor];
    v151 = [v157 constraintEqualToAnchor:v154 constant:-20.0];
    v289[14] = v151;
    v70 = [(CKSyndicationContentViewController *)self micropillView2];
    v71 = [v70 widthAnchor];
    [(CKSyndicationContentViewController *)self maxContentSize];
    v73 = [v71 constraintLessThanOrEqualToConstant:v72 - v29];
    v289[15] = v73;
    v74 = [(CKSyndicationContentViewController *)self micropillView2];
    v75 = [v74 heightAnchor];
    v76 = [v75 constraintEqualToConstant:25.0];
    v289[16] = v76;
    [MEMORY[0x1E4F1C978] arrayWithObjects:v289 count:17];
    v78 = v77 = v9;
    double v45 = v276;
    [v276 addObjectsFromArray:v78];

    double v9 = v77;
    double v46 = v273;

    unint64_t v5 = 0x1E4F28000;
    v54 = v261;

    v50 = v264;
    v49 = v279;

    objc_super v48 = (void *)v270;
    v47 = (void *)v267;
  }
  else
  {
    if (v44) {
      goto LABEL_26;
    }
    double v45 = [(CKSyndicationContentViewController *)self constraints];
    v283 = [(CKSyndicationContentViewController *)self sharedWithYouViewController];
    double v46 = [v283 view];
    v47 = [v46 topAnchor];
    objc_super v48 = [v9 topAnchor];
    v49 = [v47 constraintEqualToAnchor:v48];
    v290[0] = v49;
    v50 = [(CKSyndicationContentViewController *)self sharedWithYouViewController];
    v285 = [v50 view];
    uint64_t v51 = [v285 centerXAnchor];
    uint64_t v52 = [v9 centerXAnchor];
    v284 = (void *)v51;
    v53 = (void *)v51;
    v54 = (void *)v52;
    v282 = [v53 constraintEqualToAnchor:v52];
    v290[1] = v282;
    v281 = [MEMORY[0x1E4F1C978] arrayWithObjects:v290 count:2];
    objc_msgSend(v45, "addObjectsFromArray:");
  }

LABEL_26:
  v89 = [(CKSyndicationContentViewController *)self constraints];
  uint64_t v90 = [v89 count];

  if (v90)
  {
    v91 = *(void **)(v5 + 3528);
    v92 = [(CKSyndicationContentViewController *)self constraints];
    [v91 activateConstraints:v92];
  }
  v286.receiver = self;
  v286.super_class = (Class)CKSyndicationContentViewController;
  [(CKSyndicationContentViewController *)&v286 updateViewConstraints];
}

- (void)setUpSharedWithYouContentCollectionView
{
  unint64_t v5 = objc_alloc_init(CKSyndicationSharedWithYouViewController);
  [(CKSyndicationContentViewController *)self setSharedWithYouViewController:v5];
  unint64_t v3 = [(CKSyndicationContentViewController *)self contentView];
  uint64_t v4 = [(CKSyndicationSharedWithYouViewController *)v5 view];
  [v3 addSubview:v4];
}

- (id)_setUpPhotosMicropillForAvatarImage:(id)a3 forName:(id)a4
{
  id v5 = a4;
  v6 = (objc_class *)MEMORY[0x1E4F42B38];
  id v7 = a3;
  id v8 = objc_alloc_init(v6);
  [v8 setTranslatesAutoresizingMaskIntoConstraints:0];
  [v8 setNumberOfLines:0];
  double v9 = [v8 layer];
  [v9 setMasksToBounds:1];

  double v10 = [MEMORY[0x1E4F428B8] tertiarySystemBackgroundColor];
  [v8 setBackgroundColor:v10];

  double v11 = [MEMORY[0x1E4F42738] sharedApplication];
  uint64_t v12 = [v11 userInterfaceLayoutDirection];

  double v13 = @"chevron.right";
  if (v12 == 1) {
    double v13 = @"chevron.left";
  }
  double v14 = (void *)MEMORY[0x1E4FB08E0];
  double v15 = v13;
  double v43 = [v14 systemFontOfSize:4.0];
  double v42 = [MEMORY[0x1E4F42A98] configurationWithFont:v43 scale:1];
  double v16 = [MEMORY[0x1E4F42A80] systemImageNamed:v15 withConfiguration:v42];

  double v41 = [v16 imageWithRenderingMode:2];

  objc_super v17 = [MEMORY[0x1E4FB0870] textAttachmentWithImage:v7];

  objc_msgSend(v17, "setBounds:", 0.0, -1.5, 15.0, 15.0);
  [v17 setAdjustsImageSizeForAccessibilityContentSizeCategory:1];
  BOOL v40 = [MEMORY[0x1E4F28B18] attributedStringWithAttachment:v17];
  double v18 = [MEMORY[0x1E4FB0870] textAttachmentWithImage:v41];
  objc_msgSend(v18, "setBounds:", 0.0, 1.5, 6.0, 8.0);
  [v18 setAdjustsImageSizeForAccessibilityContentSizeCategory:1];
  double v39 = [MEMORY[0x1E4F28B18] attributedStringWithAttachment:v18];
  double v19 = NSString;
  double v20 = CKFrameworkBundle();
  double v21 = [v20 localizedStringForKey:@"WHATS_NEW_SYNDICATION_PHOTOS" value:&stru_1EDE4CA38 table:@"ChatKit"];
  double v22 = objc_msgSend(v19, "stringWithFormat:", v21, v5);

  v23 = [MEMORY[0x1E4F42738] sharedApplication];
  uint64_t v24 = [v23 userInterfaceLayoutDirection];

  if (v24 == 1) {
    double v25 = @"\u200F";
  }
  else {
    double v25 = @"\u200E";
  }
  double v26 = [(__CFString *)v25 stringByAppendingString:v22];

  v27 = (void *)[objc_alloc(MEMORY[0x1E4F28E48]) initWithString:v26];
  uint64_t v28 = *MEMORY[0x1E4FB06F8];
  double v29 = [MEMORY[0x1E4FB08E0] systemFontOfSize:12.0];
  objc_msgSend(v27, "addAttribute:value:range:", v28, v29, 0, objc_msgSend(v27, "length"));

  uint64_t v30 = [v26 rangeOfString:v5];
  uint64_t v32 = v31;
  double v33 = [MEMORY[0x1E4FB08E0] boldSystemFontOfSize:12.0];
  objc_msgSend(v27, "addAttribute:value:range:", v28, v33, v30, v32);

  objc_msgSend(v27, "addAttribute:value:range:", *MEMORY[0x1E4FB06C8], &unk_1EDF17328, 0, objc_msgSend(v27, "length"));
  [v27 insertAttributedString:v40 atIndex:0];
  objc_msgSend(v27, "insertAttributedString:atIndex:", v39, objc_msgSend(v27, "length"));
  id v34 = (void *)[objc_alloc(MEMORY[0x1E4F28E48]) initWithString:@" "];
  [v27 insertAttributedString:v34 atIndex:1];
  [v27 insertAttributedString:v34 atIndex:0];
  objc_msgSend(v27, "insertAttributedString:atIndex:", v34, objc_msgSend(v27, "length") - 1);
  objc_msgSend(v27, "insertAttributedString:atIndex:", v34, objc_msgSend(v27, "length"));
  [v8 setAttributedText:v27];
  id v35 = objc_alloc(MEMORY[0x1E4F43028]);
  double v36 = [MEMORY[0x1E4F427D8] effectWithStyle:9];
  double v37 = (void *)[v35 initWithEffect:v36];

  [v8 addSubview:v37];
  [v8 sizeToFit];

  return v8;
}

- (void)setUpPhotosContent
{
  id v46 = [MEMORY[0x1E4F42A80] ckImageNamed:@"WhatsNew_Photos1"];
  unint64_t v3 = [MEMORY[0x1E4F42A80] ckImageNamed:@"WhatsNew_Photos2"];
  uint64_t v4 = (void *)[objc_alloc(MEMORY[0x1E4F42AA0]) initWithImage:v46];
  [(CKSyndicationContentViewController *)self setHighlightsView1:v4];

  id v5 = (void *)[objc_alloc(MEMORY[0x1E4F42AA0]) initWithImage:v3];
  [(CKSyndicationContentViewController *)self setHighlightsView2:v5];

  v6 = [(CKSyndicationContentViewController *)self highlightsView1];
  [v6 setTranslatesAutoresizingMaskIntoConstraints:0];

  id v7 = [(CKSyndicationContentViewController *)self highlightsView2];
  [v7 setTranslatesAutoresizingMaskIntoConstraints:0];

  id v8 = [MEMORY[0x1E4F42A80] ckImageNamed:@"Syndication_Avatar7"];
  double v9 = [MEMORY[0x1E4F42A80] ckImageNamed:@"Syndication_Avatar8"];
  double v10 = CKFrameworkBundle();
  double v11 = [v10 localizedStringForKey:@"WHATS_NEW_SYNDICATION_PHOTOS_EXAMPLE_NAME1" value:&stru_1EDE4CA38 table:@"ChatKit"];
  uint64_t v12 = [(CKSyndicationContentViewController *)self _setUpPhotosMicropillForAvatarImage:v8 forName:v11];
  [(CKSyndicationContentViewController *)self setMicropillView1:v12];

  double v13 = CKFrameworkBundle();
  double v14 = [v13 localizedStringForKey:@"WHATS_NEW_SYNDICATION_PHOTOS_EXAMPLE_NAME2" value:&stru_1EDE4CA38 table:@"ChatKit"];
  double v15 = [(CKSyndicationContentViewController *)self _setUpPhotosMicropillForAvatarImage:v9 forName:v14];
  [(CKSyndicationContentViewController *)self setMicropillView2:v15];

  double v16 = [(CKSyndicationContentViewController *)self highlightsView1];
  objc_super v17 = [v16 layer];
  [v17 setCornerRadius:25.0];

  double v18 = [(CKSyndicationContentViewController *)self highlightsView2];
  double v19 = [v18 layer];
  [v19 setCornerRadius:25.0];

  double v20 = [(CKSyndicationContentViewController *)self highlightsView1];
  double v21 = [v20 layer];
  [v21 setMasksToBounds:1];

  double v22 = [(CKSyndicationContentViewController *)self highlightsView2];
  v23 = [v22 layer];
  [v23 setMasksToBounds:1];

  id v24 = objc_alloc_init(MEMORY[0x1E4F42AA0]);
  double v25 = [v24 layer];
  id v26 = [MEMORY[0x1E4F428B8] blackColor];
  objc_msgSend(v25, "setShadowColor:", objc_msgSend(v26, "CGColor"));

  v27 = [v24 layer];
  LODWORD(v28) = *(_DWORD *)"333?";
  [v27 setShadowOpacity:v28];

  double v29 = [v24 layer];
  [v29 setShadowRadius:25.0];

  uint64_t v30 = [v24 layer];
  objc_msgSend(v30, "setShadowOffset:", 0.0, 2.0);

  uint64_t v31 = [(CKSyndicationContentViewController *)self highlightsView1];
  [v24 addSubview:v31];

  id v32 = objc_alloc_init(MEMORY[0x1E4F42AA0]);
  double v33 = [v32 layer];
  id v34 = [MEMORY[0x1E4F428B8] blackColor];
  objc_msgSend(v33, "setShadowColor:", objc_msgSend(v34, "CGColor"));

  id v35 = [v32 layer];
  LODWORD(v36) = *(_DWORD *)"333?";
  [v35 setShadowOpacity:v36];

  double v37 = [v32 layer];
  [v37 setShadowRadius:10.0];

  double v38 = [v32 layer];
  objc_msgSend(v38, "setShadowOffset:", 0.0, 2.0);

  double v39 = [(CKSyndicationContentViewController *)self highlightsView2];
  [v32 addSubview:v39];

  BOOL v40 = [(CKSyndicationContentViewController *)self contentView];
  [v40 addSubview:v24];

  double v41 = [(CKSyndicationContentViewController *)self contentView];
  [v41 addSubview:v32];

  double v42 = [(CKSyndicationContentViewController *)self contentView];
  double v43 = [(CKSyndicationContentViewController *)self micropillView1];
  [v42 addSubview:v43];

  unint64_t v44 = [(CKSyndicationContentViewController *)self contentView];
  double v45 = [(CKSyndicationContentViewController *)self micropillView2];
  [v44 addSubview:v45];
}

- (void)setUpHighlightsContent
{
  v44[2] = *MEMORY[0x1E4F143B8];
  unint64_t v3 = [CKSyndicationOnboardingLinkBalloonView alloc];
  uint64_t v4 = (void *)[objc_alloc(MEMORY[0x1E4F1CB10]) initWithString:@"https://tv.apple.com/us/show/mythic-quest/umc.cmc.1nfdfd5zlk05fo1bwwetzldy3?ctx_brand=tvs.sbd.4000"];
  double v5 = *MEMORY[0x1E4F1DB28];
  double v6 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
  double v7 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
  double v8 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  double v9 = -[CKSyndicationOnboardingLinkBalloonView initWithFrame:withURL:](v3, "initWithFrame:withURL:", v4, *MEMORY[0x1E4F1DB28], v6, v7, v8);

  double v10 = [CKSyndicationOnboardingLinkBalloonView alloc];
  double v11 = (void *)[objc_alloc(MEMORY[0x1E4F1CB10]) initWithString:@"https://podcasts.apple.com/us/podcast/eight-we-go-all/id1507423923?i=1000476834241"];
  uint64_t v12 = -[CKSyndicationOnboardingLinkBalloonView initWithFrame:withURL:](v10, "initWithFrame:withURL:", v11, v5, v6, v7, v8);

  double v13 = [CKSyndicationOnboardingLinkBalloonView alloc];
  double v14 = (void *)[objc_alloc(MEMORY[0x1E4F1CB10]) initWithString:@"https://music.apple.com/us/album/green-eyes/1534718812?i=1534719300"];
  double v15 = -[CKSyndicationOnboardingLinkBalloonView initWithFrame:withURL:](v13, "initWithFrame:withURL:", v14, v5, v6, v7, v8);

  [(CKSyndicationOnboardingLinkBalloonView *)v9 setUserInteractionEnabled:0];
  [(CKSyndicationOnboardingLinkBalloonView *)v12 setUserInteractionEnabled:0];
  [(CKSyndicationOnboardingLinkBalloonView *)v15 setUserInteractionEnabled:0];
  [(CKSyndicationOnboardingLinkBalloonView *)v9 setTranslatesAutoresizingMaskIntoConstraints:0];
  [(CKSyndicationOnboardingLinkBalloonView *)v12 setTranslatesAutoresizingMaskIntoConstraints:0];
  [(CKSyndicationOnboardingLinkBalloonView *)v15 setTranslatesAutoresizingMaskIntoConstraints:0];
  double v16 = [(CKSyndicationContentViewController *)self contentView];
  [v16 addSubview:v9];

  objc_super v17 = [(CKSyndicationContentViewController *)self contentView];
  [v17 addSubview:v12];

  double v18 = [(CKSyndicationContentViewController *)self contentView];
  [v18 addSubview:v15];

  [(CKSyndicationContentViewController *)self setTvLinkBalloonView:v9];
  [(CKSyndicationContentViewController *)self setPodcastLinkBalloonView:v12];
  [(CKSyndicationContentViewController *)self setMusicLinkBalloonView:v15];
  double v19 = [(CKSyndicationContentViewController *)self getPinIcon];
  [(CKSyndicationContentViewController *)self setTvPinIconView:v19];

  double v20 = [(CKSyndicationContentViewController *)self getPinIcon];
  [(CKSyndicationContentViewController *)self setPodcastPinIconView:v20];

  double v21 = [(CKSyndicationContentViewController *)self contentView];
  double v22 = [(CKSyndicationContentViewController *)self tvPinIconView];
  [v21 addSubview:v22];

  v23 = [(CKSyndicationContentViewController *)self contentView];
  id v24 = [(CKSyndicationContentViewController *)self podcastPinIconView];
  [v23 addSubview:v24];

  double v25 = objc_msgSend(objc_alloc(MEMORY[0x1E4F42FF0]), "initWithFrame:", v5, v6, v7, v8);
  [(CKSyndicationContentViewController *)self setGradientView:v25];

  id v26 = [(CKSyndicationContentViewController *)self gradientView];
  [v26 setTranslatesAutoresizingMaskIntoConstraints:0];

  v27 = [MEMORY[0x1E4F39BD0] layer];
  [(CKSyndicationContentViewController *)self setGradientLayer:v27];
  double v28 = [(CKSyndicationContentViewController *)self gradientView];
  [v28 frame];
  objc_msgSend(v27, "setFrame:");

  double v29 = [(CKSyndicationContentViewController *)self traitCollection];
  uint64_t v30 = [v29 userInterfaceStyle];

  if (v30 == 2)
  {
    id v31 = [MEMORY[0x1E4F428B8] colorWithWhite:0.0 alpha:0.0];
    v44[0] = [v31 CGColor];
    id v32 = [MEMORY[0x1E4F428B8] systemBackgroundColor];
    v44[1] = [v32 CGColor];
    double v33 = (void *)MEMORY[0x1E4F1C978];
    id v34 = v44;
  }
  else
  {
    id v31 = [MEMORY[0x1E4F428B8] colorWithWhite:1.0 alpha:0.0];
    v43[0] = [v31 CGColor];
    id v32 = [MEMORY[0x1E4F428B8] systemBackgroundColor];
    v43[1] = [v32 CGColor];
    double v33 = (void *)MEMORY[0x1E4F1C978];
    id v34 = v43;
  }
  id v35 = [v33 arrayWithObjects:v34 count:2];
  double v36 = [(CKSyndicationContentViewController *)self gradientLayer];
  [v36 setColors:v35];

  double v37 = [(CKSyndicationContentViewController *)self gradientView];
  double v38 = [v37 layer];
  [v38 insertSublayer:v27 atIndex:0];

  double v39 = [(CKSyndicationContentViewController *)self contentView];
  BOOL v40 = [(CKSyndicationContentViewController *)self gradientView];
  [v39 addSubview:v40];

  double v41 = [(CKSyndicationContentViewController *)self contentView];
  double v42 = [(CKSyndicationContentViewController *)self gradientView];
  [v41 bringSubviewToFront:v42];
}

- (id)getPinIcon
{
  id v2 = objc_alloc(MEMORY[0x1E4F42FF0]);
  double v3 = *MEMORY[0x1E4F1DB28];
  double v4 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
  double v5 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
  double v6 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  double v7 = objc_msgSend(v2, "initWithFrame:", *MEMORY[0x1E4F1DB28], v4, v5, v6);
  [v7 setTranslatesAutoresizingMaskIntoConstraints:0];
  double v8 = +[CKUIBehavior sharedBehaviors];
  double v9 = [v8 messageHighlightGoldColor];
  [v7 setBackgroundColor:v9];

  double v10 = objc_msgSend(objc_alloc(MEMORY[0x1E4F42AA0]), "initWithFrame:", v3, v4, v5, v6);
  double v11 = [MEMORY[0x1E4F428B8] clearColor];
  [v10 setBackgroundColor:v11];

  [v7 addSubview:v10];
  uint64_t v12 = +[CKUIBehavior sharedBehaviors];
  double v13 = [v12 messageHighlightImage];

  [v10 setImage:v13];
  double v14 = +[CKUIBehavior sharedBehaviors];
  [v14 messageHighlightGlyphSymbolPointSize];
  double v16 = v15;

  objc_msgSend(v10, "setFrame:", (22.0 - v16) * 0.5 + 0.0, (22.0 - v16) * 0.5 + 0.0, v16, v16);

  return v7;
}

- (void)traitCollectionDidChange:(id)a3
{
  v26[2] = *MEMORY[0x1E4F143B8];
  v24.receiver = self;
  v24.super_class = (Class)CKSyndicationContentViewController;
  id v4 = a3;
  [(CKSyndicationContentViewController *)&v24 traitCollectionDidChange:v4];
  double v5 = [(CKSyndicationContentViewController *)self traitCollection];
  uint64_t v6 = [v5 userInterfaceStyle];
  uint64_t v7 = [v4 userInterfaceStyle];

  if (v6 != v7)
  {
    id v8 = [MEMORY[0x1E4F428B8] systemBackgroundColor];
    uint64_t v9 = [v8 CGColor];
    double v10 = [(CKSyndicationContentViewController *)self tvPinIconView];
    double v11 = [v10 layer];
    [v11 setBorderColor:v9];

    id v12 = [MEMORY[0x1E4F428B8] systemBackgroundColor];
    uint64_t v13 = [v12 CGColor];
    double v14 = [(CKSyndicationContentViewController *)self podcastPinIconView];
    double v15 = [v14 layer];
    [v15 setBorderColor:v13];

    double v16 = [(CKSyndicationContentViewController *)self traitCollection];
    uint64_t v17 = [v16 userInterfaceStyle];

    if (v17 == 2)
    {
      id v18 = [MEMORY[0x1E4F428B8] colorWithWhite:0.0 alpha:0.0];
      v26[0] = [v18 CGColor];
      id v19 = [MEMORY[0x1E4F428B8] systemBackgroundColor];
      v26[1] = [v19 CGColor];
      double v20 = (void *)MEMORY[0x1E4F1C978];
      double v21 = v26;
    }
    else
    {
      id v18 = [MEMORY[0x1E4F428B8] colorWithWhite:1.0 alpha:0.0];
      v25[0] = [v18 CGColor];
      id v19 = [MEMORY[0x1E4F428B8] systemBackgroundColor];
      v25[1] = [v19 CGColor];
      double v20 = (void *)MEMORY[0x1E4F1C978];
      double v21 = v25;
    }
    double v22 = [v20 arrayWithObjects:v21 count:2];
    v23 = [(CKSyndicationContentViewController *)self gradientLayer];
    [v23 setColors:v22];
  }
}

- (CKSyndicationSharedWithYouViewController)sharedWithYouViewController
{
  return self->_sharedWithYouViewController;
}

- (void)setSharedWithYouViewController:(id)a3
{
}

- (unint64_t)onboardingPage
{
  return self->_onboardingPage;
}

- (void)setOnboardingPage:(unint64_t)a3
{
  self->_onboardingPage = a3;
}

- (NSMutableArray)constraints
{
  return self->_constraints;
}

- (void)setConstraints:(id)a3
{
}

- (UIView)highlightsView1
{
  return self->_highlightsView1;
}

- (void)setHighlightsView1:(id)a3
{
}

- (UILabel)micropillView1
{
  return self->_micropillView1;
}

- (void)setMicropillView1:(id)a3
{
}

- (UIView)highlightsView2
{
  return self->_highlightsView2;
}

- (void)setHighlightsView2:(id)a3
{
}

- (UILabel)micropillView2
{
  return self->_micropillView2;
}

- (void)setMicropillView2:(id)a3
{
}

- (UIView)combinedHighlightsView
{
  return self->_combinedHighlightsView;
}

- (void)setCombinedHighlightsView:(id)a3
{
}

- (UIView)tvLinkBalloonView
{
  return self->_tvLinkBalloonView;
}

- (void)setTvLinkBalloonView:(id)a3
{
}

- (UIView)podcastLinkBalloonView
{
  return self->_podcastLinkBalloonView;
}

- (void)setPodcastLinkBalloonView:(id)a3
{
}

- (UIView)musicLinkBalloonView
{
  return self->_musicLinkBalloonView;
}

- (void)setMusicLinkBalloonView:(id)a3
{
}

- (UIView)tvPinIconView
{
  return self->_tvPinIconView;
}

- (void)setTvPinIconView:(id)a3
{
}

- (UIView)podcastPinIconView
{
  return self->_podcastPinIconView;
}

- (void)setPodcastPinIconView:(id)a3
{
}

- (UIView)gradientView
{
  return self->_gradientView;
}

- (void)setGradientView:(id)a3
{
}

- (CAGradientLayer)gradientLayer
{
  return self->_gradientLayer;
}

- (void)setGradientLayer:(id)a3
{
}

- (double)photoShortSide
{
  return self->_photoShortSide;
}

- (void)setPhotoShortSide:(double)a3
{
  self->_photoShortSide = a3;
}

- (double)photoLongSide
{
  return self->_photoLongSide;
}

- (void)setPhotoLongSide:(double)a3
{
  self->_photoLongSide = a3;
}

- (CGSize)maxContentSize
{
  double width = self->_maxContentSize.width;
  double height = self->_maxContentSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_gradientLayer, 0);
  objc_storeStrong((id *)&self->_gradientView, 0);
  objc_storeStrong((id *)&self->_podcastPinIconView, 0);
  objc_storeStrong((id *)&self->_tvPinIconView, 0);
  objc_storeStrong((id *)&self->_musicLinkBalloonView, 0);
  objc_storeStrong((id *)&self->_podcastLinkBalloonView, 0);
  objc_storeStrong((id *)&self->_tvLinkBalloonView, 0);
  objc_storeStrong((id *)&self->_combinedHighlightsView, 0);
  objc_storeStrong((id *)&self->_micropillView2, 0);
  objc_storeStrong((id *)&self->_highlightsView2, 0);
  objc_storeStrong((id *)&self->_micropillView1, 0);
  objc_storeStrong((id *)&self->_highlightsView1, 0);
  objc_storeStrong((id *)&self->_constraints, 0);

  objc_storeStrong((id *)&self->_sharedWithYouViewController, 0);
}

@end