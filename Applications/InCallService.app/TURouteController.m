@interface TURouteController
+ (unint64_t)priorityForRoute:(id)a3;
- (BOOL)areNonRelayAuxiliaryRoutesAvailable;
- (BOOL)hasAirPodsAvailable;
- (BOOL)hasAirPodsInEar;
- (NSArray)sortedRoutes;
- (TURoute)routeForSpeakerDisable;
- (UIImage)audioRouteGlyph;
- (void)fetchAudioControlsGlyphWithCompletion:(id)a3;
@end

@implementation TURouteController

- (TURoute)routeForSpeakerDisable
{
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  v2 = [(TURouteController *)self routes];
  id v3 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v9;
    while (2)
    {
      for (i = 0; i != v3; i = (char *)i + 1)
      {
        if (*(void *)v9 != v4) {
          objc_enumerationMutation(v2);
        }
        v6 = *(void **)(*((void *)&v8 + 1) + 8 * i);
        if (([v6 isReceiver] & 1) != 0
          || [v6 isDefaultRoute] && (objc_msgSend(v6, "isSpeaker") & 1) == 0)
        {
          id v3 = v6;
          goto LABEL_13;
        }
      }
      id v3 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
      if (v3) {
        continue;
      }
      break;
    }
  }
LABEL_13:

  return (TURoute *)v3;
}

+ (unint64_t)priorityForRoute:(id)a3
{
  id v3 = a3;
  unint64_t v4 = (unint64_t)[v3 deviceType];
  unint64_t v5 = 6;
  if (v4 > 0x24) {
    goto LABEL_19;
  }
  if (((1 << v4) & 0x14273F003ELL) != 0)
  {
LABEL_18:
    unint64_t v5 = 2;
    goto LABEL_19;
  }
  if (((1 << v4) & 0x298C0FFC0) == 0)
  {
    if (v4) {
      goto LABEL_19;
    }
    if (([v3 isSpeaker] & 1) != 0
      || ([v3 isReceiver] & 1) != 0
      || ([v3 isDefaultRoute] & 1) != 0)
    {
      unint64_t v5 = 1;
      goto LABEL_19;
    }
    if (([v3 isWiredHeadset] & 1) == 0
      && ([v3 isWiredHeadphones] & 1) == 0
      && ([v3 isWirelessHeadset] & 1) == 0)
    {
      if ([v3 isRecommended]) {
        unint64_t v5 = 3;
      }
      else {
        unint64_t v5 = 6;
      }
      goto LABEL_19;
    }
    goto LABEL_18;
  }
  if ([v3 isGuest]) {
    unint64_t v5 = 5;
  }
  else {
    unint64_t v5 = 4;
  }
  if ([v3 isRecommended]) {
    unint64_t v5 = 3;
  }
LABEL_19:

  return v5;
}

- (NSArray)sortedRoutes
{
  id v3 = [(TURouteController *)self routes];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10008DD64;
  v6[3] = &unk_1002CF628;
  v6[4] = self;
  unint64_t v4 = [v3 sortedArrayUsingComparator:v6];

  return (NSArray *)v4;
}

- (BOOL)areNonRelayAuxiliaryRoutesAvailable
{
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  v2 = [(TURouteController *)self routes];
  id v3 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v9;
    while (2)
    {
      for (i = 0; i != v3; i = (char *)i + 1)
      {
        if (*(void *)v9 != v4) {
          objc_enumerationMutation(v2);
        }
        v6 = *(void **)(*((void *)&v8 + 1) + 8 * i);
        if (([v6 supportsRelay] & 1) == 0
          && ([v6 isAuxiliary] & 1) != 0)
        {
          LOBYTE(v3) = 1;
          goto LABEL_12;
        }
      }
      id v3 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
      if (v3) {
        continue;
      }
      break;
    }
  }
LABEL_12:

  return (char)v3;
}

- (BOOL)hasAirPodsAvailable
{
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  v2 = [(TURouteController *)self routes];
  id v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v8;
    while (2)
    {
      for (i = 0; i != v3; i = (char *)i + 1)
      {
        if (*(void *)v8 != v4) {
          objc_enumerationMutation(v2);
        }
        if ([*(id *)(*((void *)&v7 + 1) + 8 * i) isAirPodsRoute])
        {
          LOBYTE(v3) = 1;
          goto LABEL_11;
        }
      }
      id v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
      if (v3) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return (char)v3;
}

- (BOOL)hasAirPodsInEar
{
  v2 = [(TURouteController *)self pickedRoute];
  if ([v2 isAirPodsRoute]) {
    unsigned __int8 v3 = [v2 isPreferredAndActive];
  }
  else {
    unsigned __int8 v3 = 0;
  }

  return v3;
}

- (UIImage)audioRouteGlyph
{
  if ([(TURouteController *)self areAuxiliaryRoutesAvailable])
  {
    unsigned __int8 v3 = [(TURouteController *)self pickedRoute];
    uint64_t v4 = [v3 audioRouteGlyphForDisplayStyle:0];
  }
  else
  {
    uint64_t v4 = 0;
  }

  return (UIImage *)v4;
}

- (void)fetchAudioControlsGlyphWithCompletion:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [(TURouteController *)self pickedRoute];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10008E18C;
  v7[3] = &unk_1002CF650;
  id v8 = v4;
  id v6 = v4;
  [v5 fetchAudioControlsGlyphWithCompletion:v7];
}

@end