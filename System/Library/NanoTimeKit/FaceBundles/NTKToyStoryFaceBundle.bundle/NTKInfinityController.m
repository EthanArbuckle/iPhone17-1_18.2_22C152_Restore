@interface NTKInfinityController
- (NTKInfinityListing)currentListing;
- (NTKInfinityListing)preparedListing;
- (id)_listingsOfTypes:(id)a3;
- (id)_nextToyboxListing;
- (id)_recentlyPlayedListings;
- (id)complicationColorForStyle:(unint64_t)a3;
- (id)currentComplicationColor;
- (id)currentPosterImage;
- (id)currentStyleComplicationColor;
- (id)initForDevice:(id)a3;
- (id)nextListing;
- (id)posterImageForStyle:(unint64_t)a3;
- (unint64_t)_maxRecentlyPlayedActions;
- (unint64_t)_maxRecentlyPlayedMagicMoments;
- (unint64_t)_modeFromStyle:(unint64_t)a3;
- (unint64_t)characterFromStyle:(unint64_t)a3;
- (unint64_t)controllerMode;
- (unint64_t)currentStyle;
- (void)invalidateCurrentListing;
- (void)invalidatePreparedListing;
- (void)prepareListing;
- (void)prepareUserTapAction;
- (void)setControllerMode:(unint64_t)a3;
- (void)setCurrentListing:(id)a3;
- (void)setCurrentStyle:(unint64_t)a3;
- (void)setPreparedListing:(id)a3;
- (void)setStyle:(unint64_t)a3;
- (void)startedPlayingListing:(id)a3;
@end

@implementation NTKInfinityController

- (id)initForDevice:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)NTKInfinityController;
  v5 = [(NTKInfinityController *)&v13 init];
  if (v5)
  {
    v6 = [[NTKInfinityDataSource alloc] initForDevice:v4];
    dataSource = v5->_dataSource;
    v5->_dataSource = v6;

    uint64_t v8 = +[NSMutableOrderedSet orderedSet];
    recentlyPlayedActions = v5->_recentlyPlayedActions;
    v5->_recentlyPlayedActions = (NSMutableOrderedSet *)v8;

    uint64_t v10 = +[NSMutableOrderedSet orderedSet];
    recentlyPlayedMagicMoments = v5->_recentlyPlayedMagicMoments;
    v5->_recentlyPlayedMagicMoments = (NSMutableOrderedSet *)v10;

    v5->_shouldForceActionForTap = 0;
    v5->_currentCharacter = 0;
    *(_OWORD *)&v5->_controllerMode = xmmword_9B70;
  }

  return v5;
}

- (void)prepareListing
{
  if (self->_controllerMode <= 1)
  {
    self->_preparedListing = [(NTKInfinityController *)self _nextToyboxListing];
    _objc_release_x1();
  }
}

- (id)nextListing
{
  preparedListing = self->_preparedListing;
  if (preparedListing)
  {
    id v4 = preparedListing;
  }
  else
  {
    id v4 = [(NTKInfinityController *)self _nextToyboxListing];
  }
  v5 = v4;
  v6 = self->_preparedListing;
  self->_preparedListing = 0;

  objc_storeStrong((id *)&self->_currentListing, v5);

  return v5;
}

- (id)_nextToyboxListing
{
  currentListing = self->_currentListing;
  id v4 = _NTKLoggingObjectForDomain();
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG);
  if (currentListing)
  {
    if (v5) {
      sub_7A68(v4, v6, v7, v8, v9, v10, v11, v12);
    }

    unint64_t v13 = [(NTKInfinityListing *)self->_currentListing type];
    if (v13 - 2 >= 3)
    {
      if (v13 > 1)
      {
        v22 = 0;
        goto LABEL_24;
      }
      v14 = _NTKLoggingObjectForDomain();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
        sub_7978(v14, v30, v31, v32, v33, v34, v35, v36);
      }
      v22 = &off_CF38;
    }
    else
    {
      v14 = _NTKLoggingObjectForDomain();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
        sub_79F0(v14, v15, v16, v17, v18, v19, v20, v21);
      }
      v22 = (_UNKNOWN **)&__NSArray0__struct;
    }
  }
  else
  {
    if (v5) {
      sub_7900(v4, v6, v7, v8, v9, v10, v11, v12);
    }

    if (arc4random_uniform(5u) && !self->_shouldForceActionForTap)
    {
      v14 = _NTKLoggingObjectForDomain();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
        sub_7874(v14, v37, v38, v39, v40, v41, v42, v43);
      }
      v22 = &off_CF20;
    }
    else
    {
      self->_shouldForceActionForTap = 0;
      v14 = _NTKLoggingObjectForDomain();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
        sub_77E8(v14, v23, v24, v25, v26, v27, v28, v29);
      }
      v22 = &off_CF08;
    }
  }

LABEL_24:
  v44 = [(NTKInfinityController *)self _listingsOfTypes:v22];
  v45 = _NTKLoggingObjectForDomain();
  if (os_log_type_enabled(v45, OS_LOG_TYPE_DEBUG)) {
    sub_7774();
  }

  if ([v44 count])
  {
    v46 = objc_msgSend(v44, "objectAtIndex:", arc4random_uniform((uint32_t)objc_msgSend(v44, "count")));
    v47 = _NTKLoggingObjectForDomain();
    if (os_log_type_enabled(v47, OS_LOG_TYPE_DEBUG)) {
      sub_7700();
    }
  }
  else
  {
    v46 = 0;
  }

  return v46;
}

- (id)_listingsOfTypes:(id)a3
{
  id v4 = a3;
  unint64_t controllerMode = self->_controllerMode;
  if (controllerMode == 1)
  {
    dataSource = self->_dataSource;
    unint64_t currentCharacter = self->_currentCharacter;
    uint64_t v7 = [(NTKInfinityListing *)self->_currentListing attributes];
    uint64_t v9 = [(NTKInfinityDataSource *)dataSource listingsForCharacter:currentCharacter ofTypes:v4 withAttributes:v7 recentlyUsed:&__NSArray0__struct];
    goto LABEL_5;
  }
  if (!controllerMode)
  {
    uint64_t v6 = self->_dataSource;
    uint64_t v7 = [(NTKInfinityListing *)self->_currentListing attributes];
    uint64_t v8 = [(NTKInfinityController *)self _recentlyPlayedListings];
    uint64_t v9 = [(NTKInfinityDataSource *)v6 listingsOfTypes:v4 withAttributes:v7 recentlyUsed:v8];

LABEL_5:
    goto LABEL_7;
  }
  uint64_t v9 = 0;
LABEL_7:

  return v9;
}

- (id)_recentlyPlayedListings
{
  v3 = +[NSMutableArray array];
  id v4 = [(NSMutableOrderedSet *)self->_recentlyPlayedMagicMoments array];
  [v3 addObjectsFromArray:v4];

  BOOL v5 = [(NSMutableOrderedSet *)self->_recentlyPlayedActions array];
  [v3 addObjectsFromArray:v5];

  return v3;
}

- (void)prepareUserTapAction
{
  self->_shouldForceActionForTap = 1;
  [(NTKInfinityController *)self invalidateCurrentListing];
}

- (void)invalidateCurrentListing
{
  self->_currentListing = 0;
  _objc_release_x1();
}

- (void)invalidatePreparedListing
{
  self->_preparedListing = 0;
  _objc_release_x1();
}

- (void)startedPlayingListing:(id)a3
{
  id v4 = (int *)a3;
  BOOL v5 = v4;
  if (!self->_controllerMode)
  {
    uint64_t v9 = v4;
    id v4 = (int *)[v4 type];
    if ((unint64_t)v4 - 1 >= 3)
    {
      BOOL v5 = v9;
      if (v4 != &dword_4) {
        goto LABEL_2;
      }
      p_recentlyPlayedMagicMoments = &self->_recentlyPlayedMagicMoments;
      [(NSMutableOrderedSet *)self->_recentlyPlayedMagicMoments addObject:v9];
      uint64_t v8 = (int *)[(NSMutableOrderedSet *)self->_recentlyPlayedMagicMoments count];
      id v4 = [(NTKInfinityController *)self _maxRecentlyPlayedMagicMoments];
      BOOL v5 = v9;
      if (v8 < v4) {
        goto LABEL_2;
      }
    }
    else
    {
      p_recentlyPlayedMagicMoments = &self->_recentlyPlayedActions;
      [(NSMutableOrderedSet *)self->_recentlyPlayedActions addObject:v9];
      uint64_t v7 = (int *)[(NSMutableOrderedSet *)self->_recentlyPlayedActions count];
      id v4 = [(NTKInfinityController *)self _maxRecentlyPlayedActions];
      BOOL v5 = v9;
      if (v7 < v4) {
        goto LABEL_2;
      }
    }
    id v4 = (int *)[(NSMutableOrderedSet *)*p_recentlyPlayedMagicMoments removeObjectAtIndex:0];
    BOOL v5 = v9;
  }
LABEL_2:

  _objc_release_x1(v4, v5);
}

- (unint64_t)_maxRecentlyPlayedMagicMoments
{
  uint64_t v2 = [(NTKInfinityDataSource *)self->_dataSource numberOfTotalMagicMoments];
  if (v2 >= 0) {
    uint64_t v3 = v2;
  }
  else {
    uint64_t v3 = v2 + 1;
  }
  return v3 >> 1;
}

- (unint64_t)_maxRecentlyPlayedActions
{
  uint64_t v2 = [(NTKInfinityDataSource *)self->_dataSource numberOfTotalActions];
  if (v2 >= 0) {
    uint64_t v3 = v2;
  }
  else {
    uint64_t v3 = v2 + 1;
  }
  return v3 >> 1;
}

- (void)setStyle:(unint64_t)a3
{
  self->_unint64_t currentCharacter = -[NTKInfinityController characterFromStyle:](self, "characterFromStyle:");
  unint64_t v5 = [(NTKInfinityController *)self _modeFromStyle:a3];
  if (self->_controllerMode != v5)
  {
    unint64_t currentStyle = self->_currentStyle;
    self->_unint64_t controllerMode = v5;
    self->_unint64_t currentStyle = a3;
    if (currentStyle == a3 || v5 == 0) {
      goto LABEL_9;
    }
    goto LABEL_8;
  }
  unint64_t v6 = self->_currentStyle;
  self->_unint64_t currentStyle = a3;
  if (v6 == a3) {
    return;
  }
  if (v5)
  {
LABEL_8:
    [(NSMutableOrderedSet *)self->_recentlyPlayedActions removeAllObjects];
    [(NSMutableOrderedSet *)self->_recentlyPlayedMagicMoments removeAllObjects];
  }
LABEL_9:

  [(NTKInfinityController *)self invalidateCurrentListing];
}

- (unint64_t)_modeFromStyle:(unint64_t)a3
{
  return a3 - 1 < 3;
}

- (id)currentPosterImage
{
  return [(NTKInfinityController *)self posterImageForStyle:self->_currentStyle];
}

- (id)posterImageForStyle:(unint64_t)a3
{
  if (a3 > 3)
  {
    id v4 = 0;
  }
  else
  {
    id v4 = NTKImageNamedFromAssetsBundle();
  }
  return v4;
}

- (id)currentComplicationColor
{
  uint64_t v3 = [(NTKInfinityListing *)self->_currentListing attributes];
  id v4 = [v3 colorForKey:@"color"];
  unint64_t v5 = v4;
  if (v4)
  {
    id v6 = v4;
  }
  else
  {
    id v6 = [(NTKInfinityController *)self currentStyleComplicationColor];
  }
  uint64_t v7 = v6;

  return v7;
}

- (id)currentStyleComplicationColor
{
  return [(NTKInfinityController *)self complicationColorForStyle:self->_currentStyle];
}

- (id)complicationColorForStyle:(unint64_t)a3
{
  switch(a3)
  {
    case 0uLL:
      _toyboxComplicationColor();
      self = (NTKInfinityController *)objc_claimAutoreleasedReturnValue();
      goto LABEL_9;
    case 1uLL:
      self = +[NTKInfinityDataSource buzzColor];
      goto LABEL_9;
    case 2uLL:
      self = +[NTKInfinityDataSource woodyColor];
      goto LABEL_9;
    case 3uLL:
      self = +[NTKInfinityDataSource jessieColor];
LABEL_9:
      break;
    default:
      break;
  }
  return self;
}

- (unint64_t)characterFromStyle:(unint64_t)a3
{
  if (a3 == 3) {
    return 2;
  }
  else {
    return a3 == 2;
  }
}

- (unint64_t)controllerMode
{
  return self->_controllerMode;
}

- (void)setControllerMode:(unint64_t)a3
{
  self->_unint64_t controllerMode = a3;
}

- (unint64_t)currentStyle
{
  return self->_currentStyle;
}

- (void)setCurrentStyle:(unint64_t)a3
{
  self->_unint64_t currentStyle = a3;
}

- (NTKInfinityListing)currentListing
{
  return self->_currentListing;
}

- (void)setCurrentListing:(id)a3
{
}

- (NTKInfinityListing)preparedListing
{
  return self->_preparedListing;
}

- (void)setPreparedListing:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_preparedListing, 0);
  objc_storeStrong((id *)&self->_currentListing, 0);
  objc_storeStrong((id *)&self->_recentlyPlayedMagicMoments, 0);
  objc_storeStrong((id *)&self->_recentlyPlayedActions, 0);

  objc_storeStrong((id *)&self->_dataSource, 0);
}

@end