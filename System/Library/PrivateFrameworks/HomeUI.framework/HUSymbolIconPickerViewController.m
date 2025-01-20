@interface HUSymbolIconPickerViewController
+ (NSArray)sceneIconDescriptors;
+ (id)tintColors;
+ (int64_t)indexOfIconDescriptor:(id)a3 inArray:(id)a4;
- (HFImageIconDescriptor)selectedIconDescriptor;
- (HUSymbolIconPickerDelegate)delegate;
- (HUSymbolIconPickerViewController)initWithIconDescriptors:(id)a3 selectedIconDescriptor:(id)a4 selectedTintColor:(id)a5 delegate:(id)a6;
- (NSArray)iconDescriptors;
- (UIColor)selectedTintColor;
- (id)_buildColorTintSectionWithEnvironment:(id)a3;
- (id)_buildHeaderSectionWithEnvironment:(id)a3;
- (id)_buildIconPickerSectionWithEnvironment:(id)a3;
- (id)_layoutSectionForSection:(int64_t)a3 layoutEnvironment:(id)a4;
- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4;
- (id)collectionView:(id)a3 viewForSupplementaryElementOfKind:(id)a4 atIndexPath:(id)a5;
- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4;
- (int64_t)numberOfSectionsInCollectionView:(id)a3;
- (void)_cancel:(id)a3;
- (void)_done:(id)a3;
- (void)applyTintColor;
- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4;
- (void)setDelegate:(id)a3;
- (void)setSelectedIconDescriptor:(id)a3;
- (void)setSelectedTintColor:(id)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
@end

@implementation HUSymbolIconPickerViewController

+ (NSArray)sceneIconDescriptors
{
  if (qword_1EA12DFA0 != -1) {
    dispatch_once(&qword_1EA12DFA0, &__block_literal_global_96);
  }
  v2 = (void *)_MergedGlobals_3_3;

  return (NSArray *)v2;
}

void __56__HUSymbolIconPickerViewController_sceneIconDescriptors__block_invoke()
{
  v4[130] = *MEMORY[0x1E4F143B8];
  v4[0] = @"bed.double.fill";
  v4[1] = @"sofa.fill";
  uint64_t v0 = *MEMORY[0x1E4F68D18];
  v4[2] = @"chair.lounge.fill";
  v4[3] = v0;
  v4[4] = @"building.2.fill";
  v4[5] = @"oven.fill";
  v4[6] = @"fork.knife";
  v4[7] = @"cup.and.saucer.fill";
  v4[8] = @"frying.pan.fill";
  v4[9] = @"sink.fill";
  v4[10] = @"bathtub.fill";
  v4[11] = @"book.closed.fill";
  v4[12] = @"book.fill";
  v4[13] = @"paintpalette.fill";
  v4[14] = @"paintbrush.fill";
  v4[15] = @"paintbrush.pointed.fill";
  v4[16] = @"ruler.fill";
  v4[17] = @"gamecontroller.fill";
  v4[18] = @"die.face.5.fill";
  v4[19] = @"theatermasks.fill";
  v4[20] = @"puzzlepiece.fill";
  v4[21] = @"metronome.fill";
  v4[22] = @"pianokeys";
  v4[23] = @"tuningfork";
  v4[24] = @"binoculars.fill";
  v4[25] = @"film.fill";
  v4[26] = @"birthday.cake.fill";
  v4[27] = @"popcorn.fill";
  v4[28] = @"wineglass.fill";
  v4[29] = @"ticket.fill";
  v4[30] = @"guitars.fill";
  v4[31] = @"fireplace.fill";
  v4[32] = @"moon.stars.fill";
  v4[33] = @"sun.and.horizon.fill";
  v4[34] = @"sunrise.fill";
  v4[35] = @"sunset.fill";
  v4[36] = @"sun.max.fill";
  v4[37] = @"cloud.rain.fill";
  v4[38] = @"drop.fill";
  v4[39] = @"wind";
  v4[40] = @"flame.fill";
  v4[41] = @"snowflake";
  v4[42] = @"thermometer.medium";
  v4[43] = @"umbrella.fill";
  v4[44] = @"leaf.fill";
  v4[45] = @"cloud.fill";
  v4[46] = @"figure.run";
  v4[47] = @"figure.socialdance";
  v4[48] = @"figure.mind.and.body";
  v4[49] = @"figure.core.training";
  v4[50] = @"figure.walk";
  v4[51] = @"figure.roll.runningpace";
  v4[52] = @"figure.indoor.cycle";
  v4[53] = @"figure.elliptical";
  v4[54] = @"figure.jumprope";
  v4[55] = @"figure.highintensity.intervaltraining";
  v4[56] = @"figure.walk.arrival";
  v4[57] = @"figure.walk.departure";
  v4[58] = @"person.2.fill";
  v4[59] = @"baseball.fill";
  v4[60] = @"basketball.fill";
  v4[61] = @"dumbbell.fill";
  v4[62] = @"football.fill";
  v4[63] = @"soccerball";
  v4[64] = @"tennisball.fill";
  v4[65] = @"volleyball.fill";
  v4[66] = @"speaker.wave.2.fill";
  v4[67] = @"phone.fill";
  v4[68] = @"video.fill";
  v4[69] = @"alarm.fill";
  v4[70] = @"calendar";
  v4[71] = @"clock.fill";
  v4[72] = @"envelope.fill";
  v4[73] = @"hifispeaker.2.fill";
  v4[74] = @"radio.fill";
  v4[75] = @"person.crop.rectangle.fill";
  v4[76] = @"person.lanyardcard.fill";
  v4[77] = @"tv.and.hifispeaker.fill";
  v4[78] = @"display";
  v4[79] = @"play.tv.fill";
  v4[80] = @"cart.fill";
  v4[81] = @"briefcase.fill";
  v4[82] = @"suitcase.fill";
  v4[83] = @"suitcase.cart.fill";
  v4[84] = @"keyboard.fill";
  v4[85] = @"lock.shield.fill";
  v4[86] = @"lightbulb.fill";
  v4[87] = @"lightbulb.slash.fill";
  v4[88] = @"scissors";
  v4[89] = @"airplane";
  v4[90] = @"car.fill";
  v4[91] = @"heart.fill";
  v4[92] = @"dial.medium.fill";
  v4[93] = @"fanblades.fill";
  v4[94] = @"wrench.and.screwdriver.fill";
  v4[95] = @"lock.fill";
  v4[96] = @"trophy.fill";
  v4[97] = @"studentdesk";
  v4[98] = @"tshirt.fill";
  v4[99] = @"balloon.2.fill";
  v4[100] = @"flag.fill";
  v4[101] = @"sparkles";
  v4[102] = @"party.popper.fill";
  v4[103] = @"music.mic";
  v4[104] = @"wand.and.stars";
  v4[105] = @"emoji.face.smiling.with.sunglasses";
  v4[106] = @"emoji.face.smiling.with.hearts";
  v4[107] = @"emoji.face.smiling.with.heart.eyes";
  v4[108] = @"memoji";
  v4[109] = @"emoji.ghost";
  v4[110] = @"emoji.skull";
  v4[111] = @"emoji.alien";
  v4[112] = @"emoji.unicorn";
  v4[113] = @"emoji.horse.face";
  v4[114] = @"emoji.snake";
  v4[115] = @"emoji.mouse.face";
  v4[116] = @"emoji.pig.face";
  v4[117] = @"emoji.monkey.face";
  v4[118] = @"emoji.cow.face";
  v4[119] = @"emoji.tiger.face";
  v4[120] = @"emoji.ram.face";
  v4[121] = @"emoji.rabbit.face";
  v4[122] = @"emoji.dragon.face";
  v4[123] = @"emoji.robot.face";
  v4[124] = @"emoji.alien.monster";
  v4[125] = @"emoji.pile.of.poop";
  v4[126] = @"emoji.dog.face";
  v4[127] = @"emoji.bear.face";
  v4[128] = @"emoji.cat.face";
  v4[129] = @"emoji.chicken.face";
  v1 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:130];
  uint64_t v2 = objc_msgSend(v1, "na_map:", &__block_literal_global_465);
  v3 = (void *)_MergedGlobals_3_3;
  _MergedGlobals_3_3 = v2;
}

id __56__HUSymbolIconPickerViewController_sceneIconDescriptors__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v2 = (objc_class *)MEMORY[0x1E4F691D0];
  id v3 = a2;
  v4 = (void *)[[v2 alloc] initWithSystemImageNamed:v3];

  return v4;
}

+ (id)tintColors
{
  if (qword_1EA12DFB0 != -1) {
    dispatch_once(&qword_1EA12DFB0, &__block_literal_global_467);
  }
  uint64_t v2 = (void *)qword_1EA12DFA8;

  return v2;
}

void __46__HUSymbolIconPickerViewController_tintColors__block_invoke()
{
  v14[12] = *MEMORY[0x1E4F143B8];
  v13 = [MEMORY[0x1E4F428B8] systemRedColor];
  v14[0] = v13;
  v12 = [MEMORY[0x1E4F428B8] systemOrangeColor];
  v14[1] = v12;
  uint64_t v0 = [MEMORY[0x1E4F428B8] systemYellowColor];
  v14[2] = v0;
  v1 = [MEMORY[0x1E4F428B8] systemGreenColor];
  v14[3] = v1;
  uint64_t v2 = [MEMORY[0x1E4F428B8] systemMintColor];
  v14[4] = v2;
  id v3 = [MEMORY[0x1E4F428B8] systemCyanColor];
  v14[5] = v3;
  v4 = [MEMORY[0x1E4F428B8] systemTealColor];
  v14[6] = v4;
  v5 = [MEMORY[0x1E4F428B8] systemBlueColor];
  v14[7] = v5;
  v6 = [MEMORY[0x1E4F428B8] systemIndigoColor];
  v14[8] = v6;
  v7 = [MEMORY[0x1E4F428B8] systemPurpleColor];
  v14[9] = v7;
  v8 = [MEMORY[0x1E4F428B8] systemPinkColor];
  v14[10] = v8;
  v9 = [MEMORY[0x1E4F428B8] systemBrownColor];
  v14[11] = v9;
  uint64_t v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:12];
  v11 = (void *)qword_1EA12DFA8;
  qword_1EA12DFA8 = v10;
}

- (HUSymbolIconPickerViewController)initWithIconDescriptors:(id)a3 selectedIconDescriptor:(id)a4 selectedTintColor:(id)a5 delegate:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  objc_initWeak(&location, self);
  id v15 = objc_alloc(MEMORY[0x1E4F42870]);
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __110__HUSymbolIconPickerViewController_initWithIconDescriptors_selectedIconDescriptor_selectedTintColor_delegate___block_invoke;
  v24[3] = &unk_1E638A0A0;
  objc_copyWeak(&v25, &location);
  v16 = (void *)[v15 initWithSectionProvider:v24];
  v23.receiver = self;
  v23.super_class = (Class)HUSymbolIconPickerViewController;
  v17 = [(HUSymbolIconPickerViewController *)&v23 initWithCollectionViewLayout:v16];
  if (v17)
  {
    if ([(id)objc_opt_class() indexOfIconDescriptor:v12 inArray:v11] == 0x7FFFFFFFFFFFFFFFLL)
    {
      id v18 = objc_alloc(MEMORY[0x1E4F691D0]);
      uint64_t v19 = [v18 initWithSystemImageNamed:*MEMORY[0x1E4F68D18]];

      id v12 = (id)v19;
    }
    objc_storeStrong((id *)&v17->_iconDescriptors, a3);
    objc_storeStrong((id *)&v17->_selectedIconDescriptor, v12);
    v20 = v13;
    if (!v13)
    {
      v20 = [MEMORY[0x1E4F428B8] systemOrangeColor];
    }
    objc_storeStrong((id *)&v17->_selectedTintColor, v20);
    if (!v13) {

    }
    objc_storeWeak((id *)&v17->_delegate, v14);
    v21 = _HULocalizedStringWithDefaultValue(@"HUIconPickerTitle", @"HUIconPickerTitle", 1);
    [(HUSymbolIconPickerViewController *)v17 setTitle:v21];

    [(HUSymbolIconPickerViewController *)v17 applyTintColor];
  }

  objc_destroyWeak(&v25);
  objc_destroyWeak(&location);

  return v17;
}

id __110__HUSymbolIconPickerViewController_initWithIconDescriptors_selectedIconDescriptor_selectedTintColor_delegate___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  v4 = (id *)(a1 + 32);
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained(v4);
  v7 = [WeakRetained _layoutSectionForSection:a2 layoutEnvironment:v5];

  return v7;
}

- (void)viewDidLoad
{
  v21.receiver = self;
  v21.super_class = (Class)HUSymbolIconPickerViewController;
  [(HUSymbolIconPickerViewController *)&v21 viewDidLoad];
  id v3 = [(HUSymbolIconPickerViewController *)self collectionView];
  [v3 setAllowsMultipleSelection:1];

  v4 = [MEMORY[0x1E4F428B8] systemBackgroundColor];
  id v5 = [(HUSymbolIconPickerViewController *)self collectionView];
  [v5 setBackgroundColor:v4];

  v6 = [(HUSymbolIconPickerViewController *)self collectionView];
  [v6 registerClass:objc_opt_class() forCellWithReuseIdentifier:@"header"];

  v7 = [(HUSymbolIconPickerViewController *)self collectionView];
  [v7 registerClass:objc_opt_class() forCellWithReuseIdentifier:@"colorTint"];

  v8 = [(HUSymbolIconPickerViewController *)self collectionView];
  [v8 registerClass:objc_opt_class() forSupplementaryViewOfKind:*MEMORY[0x1E4F43750] withReuseIdentifier:@"colorTintSeparator"];

  v9 = [(HUSymbolIconPickerViewController *)self collectionView];
  [v9 registerClass:objc_opt_class() forCellWithReuseIdentifier:@"icon"];

  uint64_t v10 = (void *)[objc_alloc(MEMORY[0x1E4F427C0]) initWithBarButtonSystemItem:1 target:self action:sel__cancel_];
  id v11 = [(HUSymbolIconPickerViewController *)self navigationItem];
  [v11 setLeftBarButtonItem:v10];

  id v12 = [(HUSymbolIconPickerViewController *)self navigationItem];
  id v13 = [v12 leftBarButtonItem];
  [v13 setAccessibilityIdentifier:@"Home.Scene.ChooseIcon.Cancel"];

  id v14 = (void *)[objc_alloc(MEMORY[0x1E4F427C0]) initWithBarButtonSystemItem:0 target:self action:sel__done_];
  id v15 = [(HUSymbolIconPickerViewController *)self navigationItem];
  [v15 setRightBarButtonItem:v14];

  v16 = [(HUSymbolIconPickerViewController *)self selectedIconDescriptor];
  v17 = [(HUSymbolIconPickerViewController *)self navigationItem];
  id v18 = [v17 rightBarButtonItem];
  [v18 setEnabled:v16 != 0];

  uint64_t v19 = [(HUSymbolIconPickerViewController *)self navigationItem];
  v20 = [v19 rightBarButtonItem];
  [v20 setAccessibilityIdentifier:@"Home.Scene.ChooseIcon.Done"];
}

- (void)viewDidLayoutSubviews
{
  v19.receiver = self;
  v19.super_class = (Class)HUSymbolIconPickerViewController;
  [(HUSymbolIconPickerViewController *)&v19 viewDidLayoutSubviews];
  uint64_t v3 = [(HUSymbolIconPickerViewController *)self selectedIconDescriptor];
  if (v3)
  {
    v4 = (void *)v3;
    id v5 = [(HUSymbolIconPickerViewController *)self collectionView];
    v6 = [v5 indexPathsForSelectedItems];
    uint64_t v7 = [v6 count];

    if (!v7)
    {
      v8 = objc_opt_class();
      v9 = [(HUSymbolIconPickerViewController *)self selectedIconDescriptor];
      uint64_t v10 = [(HUSymbolIconPickerViewController *)self iconDescriptors];
      uint64_t v11 = [v8 indexOfIconDescriptor:v9 inArray:v10];

      if (v11 != 0x7FFFFFFFFFFFFFFFLL)
      {
        id v12 = [(HUSymbolIconPickerViewController *)self collectionView];
        id v13 = [MEMORY[0x1E4F28D58] indexPathForItem:v11 inSection:2];
        [v12 selectItemAtIndexPath:v13 animated:0 scrollPosition:0];
      }
      id v14 = [(id)objc_opt_class() tintColors];
      id v15 = [(HUSymbolIconPickerViewController *)self selectedTintColor];
      uint64_t v16 = [v14 indexOfObject:v15];

      if (v16 != 0x7FFFFFFFFFFFFFFFLL)
      {
        v17 = [(HUSymbolIconPickerViewController *)self collectionView];
        id v18 = [MEMORY[0x1E4F28D58] indexPathForItem:v16 inSection:1];
        [v17 selectItemAtIndexPath:v18 animated:0 scrollPosition:0];
      }
    }
  }
}

- (void)applyTintColor
{
  uint64_t v3 = [(HUSymbolIconPickerViewController *)self selectedTintColor];

  if (v3)
  {
    v4 = (void *)MEMORY[0x1E4F42A98];
    id v5 = [(HUSymbolIconPickerViewController *)self selectedTintColor];
    id v8 = [v4 configurationWithHierarchicalColor:v5];

    v6 = [(HUSymbolIconPickerViewController *)self selectedIconDescriptor];
    uint64_t v7 = [v6 imageIconDescriptorWithUpdatedImageSymbolConfiguration:v8];
    [(HUSymbolIconPickerViewController *)self setSelectedIconDescriptor:v7];
  }
}

+ (int64_t)indexOfIconDescriptor:(id)a3 inArray:(id)a4
{
  id v5 = a3;
  v6 = [a4 valueForKey:@"imageIdentifier"];
  uint64_t v7 = [v5 imageIdentifier];

  int64_t v8 = [v6 indexOfObject:v7];
  return v8;
}

- (void)_cancel:(id)a3
{
  id v4 = [(HUSymbolIconPickerViewController *)self delegate];
  [v4 iconPickerDidCancel:self];
}

- (void)_done:(id)a3
{
  id v6 = [(HUSymbolIconPickerViewController *)self delegate];
  id v4 = [(HUSymbolIconPickerViewController *)self selectedIconDescriptor];
  id v5 = [(HUSymbolIconPickerViewController *)self selectedTintColor];
  [v6 iconPicker:self didPickIcon:v4 withTintColor:v5];
}

- (id)_layoutSectionForSection:(int64_t)a3 layoutEnvironment:(id)a4
{
  id v6 = a4;
  switch(a3)
  {
    case 2:
      uint64_t v7 = [(HUSymbolIconPickerViewController *)self _buildIconPickerSectionWithEnvironment:v6];
      goto LABEL_7;
    case 1:
      uint64_t v7 = [(HUSymbolIconPickerViewController *)self _buildColorTintSectionWithEnvironment:v6];
      goto LABEL_7;
    case 0:
      uint64_t v7 = [(HUSymbolIconPickerViewController *)self _buildHeaderSectionWithEnvironment:v6];
LABEL_7:
      int64_t v8 = (void *)v7;
      goto LABEL_9;
  }
  int64_t v8 = 0;
LABEL_9:

  return v8;
}

- (id)_buildHeaderSectionWithEnvironment:(id)a3
{
  uint64_t v3 = (void *)MEMORY[0x1E4F42628];
  id v4 = (void *)MEMORY[0x1E4F42638];
  id v5 = objc_msgSend(MEMORY[0x1E4F42608], "fractionalWidthDimension:", a3, 1.0);
  id v6 = [MEMORY[0x1E4F42608] fractionalHeightDimension:1.0];
  uint64_t v7 = [v4 sizeWithWidthDimension:v5 heightDimension:v6];
  int64_t v8 = [v3 itemWithLayoutSize:v7];

  objc_msgSend(v8, "setContentInsets:", 15.0, 15.0, 15.0, 15.0);
  v9 = (void *)MEMORY[0x1E4F42638];
  uint64_t v10 = [MEMORY[0x1E4F42608] fractionalWidthDimension:1.0];
  uint64_t v11 = [MEMORY[0x1E4F42608] absoluteDimension:120.0];
  id v12 = [v9 sizeWithWidthDimension:v10 heightDimension:v11];

  id v13 = [MEMORY[0x1E4F42618] horizontalGroupWithLayoutSize:v12 subitem:v8 count:1];
  id v14 = [MEMORY[0x1E4F42630] sectionWithGroup:v13];
  objc_msgSend(v14, "setContentInsets:", 15.0, 30.0, 10.0, 30.0);

  return v14;
}

- (id)_buildColorTintSectionWithEnvironment:(id)a3
{
  v25[1] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = (void *)MEMORY[0x1E4F42638];
  id v4 = objc_msgSend(MEMORY[0x1E4F42608], "absoluteDimension:", a3, 52.0);
  id v5 = [MEMORY[0x1E4F42608] absoluteDimension:52.0];
  id v6 = [v3 sizeWithWidthDimension:v4 heightDimension:v5];

  uint64_t v7 = (void *)MEMORY[0x1E4F42638];
  int64_t v8 = [MEMORY[0x1E4F42608] fractionalWidthDimension:1.0];
  v9 = [v6 heightDimension];
  uint64_t v10 = [v7 sizeWithWidthDimension:v8 heightDimension:v9];

  uint64_t v11 = [MEMORY[0x1E4F42628] itemWithLayoutSize:v6];
  objc_msgSend(v11, "setContentInsets:", 5.0, 5.0, 5.0, 5.0);
  id v12 = (void *)MEMORY[0x1E4F42618];
  v25[0] = v11;
  id v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v25 count:1];
  id v14 = [v12 horizontalGroupWithLayoutSize:v10 subitems:v13];

  id v15 = [MEMORY[0x1E4F42640] flexibleSpacing:0.0];
  [v14 setInterItemSpacing:v15];

  uint64_t v16 = [MEMORY[0x1E4F42630] sectionWithGroup:v14];
  [v16 setInterGroupSpacing:5.0];
  objc_msgSend(v16, "setContentInsets:", 10.0, 30.0, 30.0, 30.0);
  v17 = (void *)MEMORY[0x1E4F42638];
  id v18 = [MEMORY[0x1E4F42608] fractionalWidthDimension:1.0];
  objc_super v19 = [MEMORY[0x1E4F42608] absoluteDimension:0.5];
  v20 = [v17 sizeWithWidthDimension:v18 heightDimension:v19];

  objc_super v21 = [MEMORY[0x1E4F425F8] boundarySupplementaryItemWithLayoutSize:v20 elementKind:*MEMORY[0x1E4F43750] alignment:5];
  v24 = v21;
  v22 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v24 count:1];
  [v16 setBoundarySupplementaryItems:v22];

  [v16 setSupplementariesFollowContentInsets:0];

  return v16;
}

- (id)_buildIconPickerSectionWithEnvironment:(id)a3
{
  v18[1] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = (void *)MEMORY[0x1E4F42638];
  id v4 = objc_msgSend(MEMORY[0x1E4F42608], "absoluteDimension:", a3, 45.0);
  id v5 = [MEMORY[0x1E4F42608] absoluteDimension:45.0];
  id v6 = [v3 sizeWithWidthDimension:v4 heightDimension:v5];

  uint64_t v7 = (void *)MEMORY[0x1E4F42638];
  int64_t v8 = [MEMORY[0x1E4F42608] fractionalWidthDimension:1.0];
  v9 = [v6 heightDimension];
  uint64_t v10 = [v7 sizeWithWidthDimension:v8 heightDimension:v9];

  uint64_t v11 = [MEMORY[0x1E4F42628] itemWithLayoutSize:v6];
  id v12 = (void *)MEMORY[0x1E4F42618];
  v18[0] = v11;
  id v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:1];
  id v14 = [v12 horizontalGroupWithLayoutSize:v10 subitems:v13];

  id v15 = [MEMORY[0x1E4F42640] flexibleSpacing:10.0];
  [v14 setInterItemSpacing:v15];

  uint64_t v16 = [MEMORY[0x1E4F42630] sectionWithGroup:v14];
  [v16 setInterGroupSpacing:20.0];
  objc_msgSend(v16, "setContentInsets:", 25.0, 30.0, 15.0, 30.0);

  return v16;
}

- (int64_t)numberOfSectionsInCollectionView:(id)a3
{
  return 3;
}

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  id v6 = a3;
  if (a4)
  {
    if (a4 == 2)
    {
      uint64_t v7 = [(HUSymbolIconPickerViewController *)self iconDescriptors];
    }
    else
    {
      if (a4 != 1)
      {
        int64_t v8 = -1;
        goto LABEL_9;
      }
      uint64_t v7 = [(id)objc_opt_class() tintColors];
    }
    v9 = v7;
    int64_t v8 = [v7 count];
  }
  else
  {
    int64_t v8 = 1;
  }
LABEL_9:

  return v8;
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [v7 section];
  if (v8 == 2)
  {
    uint64_t v11 = [v6 dequeueReusableCellWithReuseIdentifier:@"icon" forIndexPath:v7];
    id v12 = [(HUSymbolIconPickerViewController *)self iconDescriptors];
    id v13 = objc_msgSend(v12, "objectAtIndexedSubscript:", objc_msgSend(v7, "item"));
    id v14 = [(HUSymbolIconPickerViewController *)self selectedTintColor];
    [v11 setIconDescriptor:v13 andSelectedTintColor:v14];

    id v9 = v11;
    id v15 = [(HUSymbolIconPickerViewController *)self iconDescriptors];
    uint64_t v16 = objc_msgSend(v15, "objectAtIndexedSubscript:", objc_msgSend(v7, "item"));
    v17 = [v16 imageIdentifier];
    [v9 setAccessibilityIdentifier:v17];

LABEL_7:
    goto LABEL_9;
  }
  if (v8 == 1)
  {
    id v18 = [v6 dequeueReusableCellWithReuseIdentifier:@"colorTint" forIndexPath:v7];
    objc_super v19 = [(id)objc_opt_class() tintColors];
    v20 = objc_msgSend(v19, "objectAtIndexedSubscript:", objc_msgSend(v7, "item"));
    [v18 setColor:v20];

    id v9 = v18;
    id v15 = [v9 color];
    uint64_t v16 = [v15 accessibilityName];
    [v9 setAccessibilityIdentifier:v16];

    goto LABEL_7;
  }
  if (v8)
  {
    id v9 = 0;
  }
  else
  {
    id v9 = [v6 dequeueReusableCellWithReuseIdentifier:@"header" forIndexPath:v7];
    uint64_t v10 = [(HUSymbolIconPickerViewController *)self selectedIconDescriptor];
    [v9 setIconDescriptor:v10];

    [v9 setUserInteractionEnabled:0];
  }
LABEL_9:

  return v9;
}

- (id)collectionView:(id)a3 viewForSupplementaryElementOfKind:(id)a4 atIndexPath:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  if (([v8 isEqualToString:*MEMORY[0x1E4F43750]] & 1) == 0) {
    NSLog(&cfstr_AskedForAViewF.isa, v8);
  }
  uint64_t v10 = [v7 dequeueReusableSupplementaryViewOfKind:v8 withReuseIdentifier:@"colorTintSeparator" forIndexPath:v9];
  uint64_t v11 = [MEMORY[0x1E4F428B8] separatorColor];
  [v10 setBackgroundColor:v11];

  return v10;
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = [v6 indexPathsForSelectedItems];
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v28 objects:v33 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v29;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v29 != v11) {
          objc_enumerationMutation(v8);
        }
        id v13 = *(void **)(*((void *)&v28 + 1) + 8 * i);
        if ([v7 compare:v13])
        {
          uint64_t v14 = [v13 section];
          if (v14 == [v7 section]) {
            [v6 deselectItemAtIndexPath:v13 animated:1];
          }
        }
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v28 objects:v33 count:16];
    }
    while (v10);
  }
  uint64_t v15 = [v7 section];
  if (v15 == 2)
  {
    objc_super v19 = [(HUSymbolIconPickerViewController *)self iconDescriptors];
    id v18 = objc_msgSend(v19, "objectAtIndexedSubscript:", objc_msgSend(v7, "item"));

    id v20 = objc_alloc(MEMORY[0x1E4F691D0]);
    objc_super v21 = [v18 identifier];
    v22 = [v18 imageSymbolConfiguration];
    objc_super v23 = (void *)[v20 initWithSystemImageNamed:v21 configuration:v22];
    [(HUSymbolIconPickerViewController *)self setSelectedIconDescriptor:v23];

    [(HUSymbolIconPickerViewController *)self applyTintColor];
    v24 = [(HUSymbolIconPickerViewController *)self navigationItem];
    id v25 = [v24 rightBarButtonItem];
    [v25 setEnabled:1];

    goto LABEL_15;
  }
  if (v15 == 1)
  {
    uint64_t v16 = [(id)objc_opt_class() tintColors];
    v17 = objc_msgSend(v16, "objectAtIndexedSubscript:", objc_msgSend(v7, "item"));
    [(HUSymbolIconPickerViewController *)self setSelectedTintColor:v17];

    [(HUSymbolIconPickerViewController *)self applyTintColor];
    id v18 = [v6 indexPathsForVisibleItems];
    [v6 reconfigureItemsAtIndexPaths:v18];
LABEL_15:
  }
  v26 = [MEMORY[0x1E4F28D58] indexPathForItem:0 inSection:0];
  v32 = v26;
  v27 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v32 count:1];
  [v6 reloadItemsAtIndexPaths:v27];
}

- (HFImageIconDescriptor)selectedIconDescriptor
{
  return self->_selectedIconDescriptor;
}

- (void)setSelectedIconDescriptor:(id)a3
{
}

- (UIColor)selectedTintColor
{
  return self->_selectedTintColor;
}

- (void)setSelectedTintColor:(id)a3
{
}

- (HUSymbolIconPickerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (HUSymbolIconPickerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NSArray)iconDescriptors
{
  return self->_iconDescriptors;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_iconDescriptors, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_selectedTintColor, 0);

  objc_storeStrong((id *)&self->_selectedIconDescriptor, 0);
}

@end