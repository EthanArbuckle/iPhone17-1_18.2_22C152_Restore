@interface HUCCMosaicArranger
- (HUCCMosaicArranger)initWithCCMosaicType:(unint64_t)a3;
- (NSArray)layouts;
- (id)calculateOrderingForItems:(id)a3;
- (unint64_t)chosenLayoutType;
- (unint64_t)numberOfItemsNeeded;
- (void)_configureForLandscapeGrid;
- (void)_configureForPortraitGrid;
- (void)setChosenLayoutType:(unint64_t)a3;
- (void)setLayouts:(id)a3;
- (void)setNumberOfItemsNeeded:(unint64_t)a3;
@end

@implementation HUCCMosaicArranger

- (HUCCMosaicArranger)initWithCCMosaicType:(unint64_t)a3
{
  v8.receiver = self;
  v8.super_class = (Class)HUCCMosaicArranger;
  v4 = [(HUCCMosaicArranger *)&v8 init];
  if (v4)
  {
    uint64_t v5 = [MEMORY[0x1E4F1CA48] array];
    layouts = v4->_layouts;
    v4->_layouts = (NSArray *)v5;

    if (a3 == 1) {
      [(HUCCMosaicArranger *)v4 _configureForLandscapeGrid];
    }
    else {
      [(HUCCMosaicArranger *)v4 _configureForPortraitGrid];
    }
  }
  return v4;
}

- (void)_configureForPortraitGrid
{
  v3 = +[HUCCMosaicLayout allPortraitLayouts];
  [(HUCCMosaicArranger *)self setLayouts:v3];

  unint64_t v4 = +[HUCCMosaicLayout maxItemsNeededForPortrait];

  [(HUCCMosaicArranger *)self setNumberOfItemsNeeded:v4];
}

- (void)_configureForLandscapeGrid
{
  v3 = +[HUCCMosaicLayout allLandscapeLayouts];
  [(HUCCMosaicArranger *)self setLayouts:v3];

  unint64_t v4 = +[HUCCMosaicLayout maxItemsNeededForLandscape];

  [(HUCCMosaicArranger *)self setNumberOfItemsNeeded:v4];
}

- (id)calculateOrderingForItems:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([v4 count])
  {
    unint64_t v5 = 0;
    while (v5 < [(HUCCMosaicArranger *)self numberOfItemsNeeded])
    {
      v6 = [v4 objectAtIndexedSubscript:v5];
      long long v20 = 0u;
      long long v21 = 0u;
      long long v22 = 0u;
      long long v23 = 0u;
      v7 = [(HUCCMosaicArranger *)self layouts];
      uint64_t v8 = [v7 countByEnumeratingWithState:&v20 objects:v26 count:16];
      if (v8)
      {
        uint64_t v9 = v8;
        uint64_t v10 = *(void *)v21;
LABEL_6:
        uint64_t v11 = 0;
        while (1)
        {
          if (*(void *)v21 != v10) {
            objc_enumerationMutation(v7);
          }
          v12 = *(void **)(*((void *)&v20 + 1) + 8 * v11);
          [v12 addItem:v6];
          if ([v12 priority] == 2 && (objc_msgSend(v12, "isComplete") & 1) != 0) {
            break;
          }
          if (v9 == ++v11)
          {
            uint64_t v9 = [v7 countByEnumeratingWithState:&v20 objects:v26 count:16];
            if (v9) {
              goto LABEL_6;
            }
            goto LABEL_13;
          }
        }
        id v13 = v12;

        if (!v13) {
          goto LABEL_15;
        }
        v19 = HFLogForCategory();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          id v25 = v13;
          _os_log_impl(&dword_1BE345000, v19, OS_LOG_TYPE_DEFAULT, "Mosaic Layout %@ filled, breaking.", buf, 0xCu);
        }

        goto LABEL_18;
      }
LABEL_13:

LABEL_15:
      if (++v5 >= [v4 count]) {
        break;
      }
    }
  }
  v14 = [(HUCCMosaicArranger *)self layouts];
  id v13 = [v14 lastObject];

  v6 = HFLogForCategory();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_error_impl(&dword_1BE345000, v6, OS_LOG_TYPE_ERROR, "Unable to calculate correct mosaic layout", buf, 2u);
  }
LABEL_18:

  v15 = HFLogForCategory();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v25 = v13;
    _os_log_impl(&dword_1BE345000, v15, OS_LOG_TYPE_DEFAULT, "Mosaic Layout chosen is %@", buf, 0xCu);
  }

  if (v13) {
    uint64_t v16 = [v13 layoutType];
  }
  else {
    uint64_t v16 = 0;
  }
  [(HUCCMosaicArranger *)self setChosenLayoutType:v16];
  v17 = [v13 arrangedItems];

  return v17;
}

- (unint64_t)chosenLayoutType
{
  return self->_chosenLayoutType;
}

- (void)setChosenLayoutType:(unint64_t)a3
{
  self->_chosenLayoutType = a3;
}

- (NSArray)layouts
{
  return self->_layouts;
}

- (void)setLayouts:(id)a3
{
}

- (unint64_t)numberOfItemsNeeded
{
  return self->_numberOfItemsNeeded;
}

- (void)setNumberOfItemsNeeded:(unint64_t)a3
{
  self->_numberOfItemsNeeded = a3;
}

- (void).cxx_destruct
{
}

@end