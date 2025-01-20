@interface PosterBoardApplication
- (BOOL)runTest:(id)a3 options:(id)a4;
- (NSString)currentTestName;
- (NSString)runningPPTTestName;
- (void)_runScrollPosterGalleryWithTestOptions:(id)a3 completion:(id)a4;
- (void)_runScrollPosterRackWithTestOptions:(id)a3 completion:(id)a4;
- (void)_runSwitchPosterWithTestOptions:(id)a3 completion:(id)a4;
- (void)setCurrentTestName:(id)a3;
@end

@implementation PosterBoardApplication

- (BOOL)runTest:(id)a3 options:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = +[PosterBoardTestingUtilities knownPPTTests];
  unsigned int v9 = [v8 containsObject:v6];

  if (v9)
  {
    [(PosterBoardApplication *)self setCurrentTestName:v6];
    +[PosterBoardTestingUtilities posterRackViewController];
    v30[0] = _NSConcreteStackBlock;
    v30[1] = 3221225472;
    v30[2] = sub_1000024E0;
    v30[3] = &unk_10000C338;
    id v10 = (id)objc_claimAutoreleasedReturnValue();
    id v31 = v10;
    v11 = objc_retainBlock(v30);
    v28[0] = _NSConcreteStackBlock;
    v28[1] = 3221225472;
    v28[2] = sub_1000024EC;
    v28[3] = &unk_10000C360;
    id v12 = v10;
    id v29 = v12;
    v13 = objc_retainBlock(v28);
    v24[0] = _NSConcreteStackBlock;
    v24[1] = 3221225472;
    v24[2] = sub_1000025D8;
    v24[3] = &unk_10000C3F0;
    v25 = &stru_10000C3A0;
    v14 = v11;
    id v26 = v14;
    v15 = v13;
    id v27 = v15;
    v16 = objc_retainBlock(v24);
    if ([v6 isEqualToString:@"scrollPosterRack"])
    {
      v17 = v23;
      v23[0] = _NSConcreteStackBlock;
      v23[1] = 3221225472;
      v18 = sub_1000025F4;
    }
    else if ([v6 isEqualToString:@"scrollPosterGallery"])
    {
      v17 = v22;
      v22[0] = _NSConcreteStackBlock;
      v22[1] = 3221225472;
      v18 = sub_100002604;
    }
    else
    {
      if (![v6 isEqualToString:@"switchPoster"])
      {
        BOOL v19 = 0;
        goto LABEL_10;
      }
      v17 = v21;
      v21[0] = _NSConcreteStackBlock;
      v21[1] = 3221225472;
      v18 = sub_100002614;
    }
    v17[2] = v18;
    v17[3] = &unk_10000C418;
    v17[4] = self;
    v17[5] = v7;
    ((void (*)(void *, void *))v16[2])(v16, v17);

    BOOL v19 = 1;
LABEL_10:

    goto LABEL_11;
  }
  BOOL v19 = 0;
LABEL_11:

  return v19;
}

- (void)_runScrollPosterRackWithTestOptions:(id)a3 completion:(id)a4
{
  id v5 = a3;
  v34 = self;
  v35 = [(PosterBoardApplication *)self currentTestName];
  id v6 = [v5 objectForKey:@"minNumberOfPostersInSwitcher"];
  id v7 = v6;
  if (!v6) {
    id v6 = &off_10000CE70;
  }
  v8 = [v6 unsignedIntegerValue];

  unsigned int v9 = [v5 objectForKey:@"maxNumberOfPostersInSwitcher"];
  id v10 = v9;
  if (!v9) {
    unsigned int v9 = &off_10000CE88;
  }
  id v33 = [v9 unsignedIntegerValue];

  v11 = +[PosterBoardTestingUtilities posterRackViewController];
  id v12 = [v11 posterExtensionDataStore];
  v13 = [v12 switcherConfiguration];
  v14 = [v13 configurations];
  v15 = [v14 count];

  v36 = objc_opt_new();
  v16 = objc_opt_new();
  v17 = +[PBFPPTOperation operationToResetSwitcher];
  [v16 addObject:v17];

  v18 = +[PBFPPTOperation operationToPushInToPosterSwitcher];
  [v16 addObject:v18];

  id v31 = v15;
  if (v8 >= v15) {
    unint64_t v19 = v8 - v15;
  }
  else {
    unint64_t v19 = 0;
  }
  if (v8 > v15)
  {
    unint64_t v20 = 0;
    do
    {
      v45[0] = _NSConcreteStackBlock;
      v45[1] = 3221225472;
      v45[2] = sub_100002A4C;
      v45[3] = &unk_10000C440;
      id v46 = v36;
      v21 = +[PBFPPTOperation operationToAddPosterWithProvider:@"com.apple.PosterTester.SamplePoster" descriptorIdentifier:@"red" completion:v45];
      [v16 addObject:v21];

      ++v20;
    }
    while (v20 < v19);
  }
  v22 = +[PBFPPTOperation operationToWaitForTimeInterval:](PBFPPTOperation, "operationToWaitForTimeInterval:", 5.0, v31);
  [v16 addObject:v22];

  v23 = +[PBFPPTOperation operationToScrollToFirstPoster:0];
  [v16 addObject:v23];

  v24 = +[PBFPPTOperation operationToStartTest:v35];
  [v16 addObject:v24];

  v25 = +[PBFPPTOperation operationToWaitForTimeInterval:5.0];
  [v16 addObject:v25];

  v39[0] = _NSConcreteStackBlock;
  v39[1] = 3221225472;
  v39[2] = sub_100002ACC;
  v39[3] = &unk_10000C490;
  id v40 = v35;
  v41 = v34;
  id v26 = v36;
  id v42 = v26;
  uint64_t v43 = v32;
  id v44 = v33;
  id v27 = v35;
  v28 = +[PBFPPTBlockOperation operationWithName:@"scrollPosterRack" block:v39];
  [v16 addObject:v28];

  v37[0] = _NSConcreteStackBlock;
  v37[1] = 3221225472;
  v37[2] = sub_100002D30;
  v37[3] = &unk_10000C4B8;
  id v38 = v26;
  id v29 = v26;
  v30 = +[PBFPPTOperation operationToDeletePosters:v37];
  [v16 addObject:v30];

  +[PBFPPTOperation enqueueOperations:v16];
}

- (void)_runScrollPosterGalleryWithTestOptions:(id)a3 completion:(id)a4
{
  v4 = [(PosterBoardApplication *)self currentTestName];
  id v5 = objc_opt_new();
  id v6 = +[PBFPPTOperation operationToResetSwitcher];
  [v5 addObject:v6];

  id v7 = +[PBFPPTOperation operationToPushInToPosterSwitcher];
  [v5 addObject:v7];

  v8 = +[PBFPPTOperation operationToScrollToFirstPoster:0];
  [v5 addObject:v8];

  unsigned int v9 = +[PBFPPTOperation operationToWaitForTimeInterval:5.0];
  [v5 addObject:v9];

  id v10 = +[PBFPPTOperation operationToStartTest:v4];
  [v5 addObject:v10];

  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100002F38;
  v13[3] = &unk_10000C530;
  id v14 = v4;
  id v11 = v4;
  id v12 = +[PBFPPTBlockOperation operationWithName:@"presentAndScrollPosterGallery" block:v13];
  [v5 addObject:v12];

  +[PBFPPTOperation enqueueOperations:v5];
}

- (void)_runSwitchPosterWithTestOptions:(id)a3 completion:(id)a4
{
  id v5 = a3;
  id v6 = [(PosterBoardApplication *)self currentTestName];
  id v7 = objc_opt_new();
  uint64_t v8 = [v5 objectForKeyedSubscript:@"testPosterProvider"];
  unsigned int v9 = (void *)v8;
  id v10 = @"com.apple.PosterTester.SamplePoster";
  if (v8) {
    id v10 = (__CFString *)v8;
  }
  id v11 = v10;

  id v12 = [v5 objectForKeyedSubscript:@"testPosterProviderDescriptorIdentifier"];

  v13 = @"red";
  if (v12) {
    v13 = v12;
  }
  id v14 = v13;

  v15 = objc_opt_new();
  v16 = +[PBFPPTBlockOperation operationWithName:@"selectLastPoster" block:&stru_10000C570];
  [v15 addObject:v16];

  v37[0] = _NSConcreteStackBlock;
  v37[1] = 3221225472;
  v37[2] = sub_1000036FC;
  v37[3] = &unk_10000C440;
  id v17 = v7;
  id v38 = v17;
  v18 = +[PBFPPTOperation operationToAddPosterWithProvider:v11 descriptorIdentifier:v14 completion:v37];

  [v15 addObject:v18];
  unint64_t v19 = +[PBFPPTOperation operationToResetSwitcher];
  [v15 addObject:v19];

  unint64_t v20 = +[PBFPPTOperation operationToWaitForTimeInterval:5.0];
  [v15 addObject:v20];

  v21 = +[PBFPPTOperation operationToPushInToPosterSwitcher];
  [v15 addObject:v21];

  v22 = +[PBFPPTOperation operationToWaitForTimeInterval:1.0];
  [v15 addObject:v22];

  v23 = +[PBFPPTOperation operationToStartTest:v6];
  [v15 addObject:v23];

  v24 = PBFPPTEventActionsToSwipeLeftInMiddleOfInterface();
  v25 = +[PBFPPTOperation operationToSynthesizeEventsForEventActions:v24];
  [v15 addObject:v25];

  id v26 = +[PBFPPTOperation operationToWaitForTimeInterval:1.0];
  [v15 addObject:v26];

  v35[0] = _NSConcreteStackBlock;
  v35[1] = 3221225472;
  v35[2] = sub_10000377C;
  v35[3] = &unk_10000C530;
  id v36 = v6;
  id v27 = v6;
  v28 = +[PBFPPTBlockOperation operationWithName:@"selectedPoster" block:v35];
  [v15 addObject:v28];

  id v29 = +[PBFPPTOperation operationToWaitForTimeInterval:2.0];
  [v15 addObject:v29];

  v30 = +[PBFPPTOperation operationToFinishTest:v27];
  [v15 addObject:v30];

  v33[0] = _NSConcreteStackBlock;
  v33[1] = 3221225472;
  v33[2] = sub_1000038E0;
  v33[3] = &unk_10000C4B8;
  id v34 = v17;
  id v31 = v17;
  uint64_t v32 = +[PBFPPTOperation operationToDeletePosters:v33];
  [v15 addObject:v32];

  +[PBFPPTOperation enqueueOperations:v15];
}

- (NSString)runningPPTTestName
{
  return self->_runningPPTTestName;
}

- (NSString)currentTestName
{
  return self->_currentTestName;
}

- (void)setCurrentTestName:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentTestName, 0);

  objc_storeStrong((id *)&self->_runningPPTTestName, 0);
}

@end