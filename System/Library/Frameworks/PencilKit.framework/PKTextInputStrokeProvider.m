@interface PKTextInputStrokeProvider
- (BOOL)containsStrokeWithUUID:(id)a3;
- (BOOL)slicesWithIdentifiers:(id)a3 significantlyOverlapRect:(CGRect)a4;
- (CGPoint)centroidForSlicesWithIdentifiers:(id)a3;
- (CGPoint)startingPointForSlicesWithIdentifiers:(id)a3;
- (CGRect)boundsForSliceIdentifiers:(id)a3;
- (NSNumber)strokeProviderVersion;
- (PKTextInputStrokeProvider)initWithDrawing:(id)a3;
- (id)strokesForSliceIdentifiers:(id)a3;
@end

@implementation PKTextInputStrokeProvider

- (PKTextInputStrokeProvider)initWithDrawing:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PKTextInputStrokeProvider;
  v5 = [(PKStrokeProvider *)&v9 initWithDrawing:v4];
  if (v5)
  {
    ++strokeProviderVersionCounter;
    uint64_t v6 = objc_msgSend(NSNumber, "numberWithInteger:");
    versionNumber = v5->_versionNumber;
    v5->_versionNumber = (NSNumber *)v6;
  }
  return v5;
}

- (NSNumber)strokeProviderVersion
{
  return self->_versionNumber;
}

- (CGRect)boundsForSliceIdentifiers:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  CGFloat x = *MEMORY[0x1E4F1DB20];
  CGFloat y = *(double *)(MEMORY[0x1E4F1DB20] + 8);
  CGFloat width = *(double *)(MEMORY[0x1E4F1DB20] + 16);
  CGFloat height = *(double *)(MEMORY[0x1E4F1DB20] + 24);
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v9 = v4;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v10)
  {
    uint64_t v11 = *(void *)v24;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v24 != v11) {
          objc_enumerationMutation(v9);
        }
        v13 = -[PKStrokeProvider sliceForIdentifier:](self, "sliceForIdentifier:", *(void *)(*((void *)&v23 + 1) + 8 * v12), (void)v23);
        v14 = v13;
        if (v13)
        {
          [v13 bounds];
          v32.origin.CGFloat x = v15;
          v32.origin.CGFloat y = v16;
          v32.size.CGFloat width = v17;
          v32.size.CGFloat height = v18;
          v29.origin.CGFloat x = x;
          v29.origin.CGFloat y = y;
          v29.size.CGFloat width = width;
          v29.size.CGFloat height = height;
          CGRect v30 = CGRectUnion(v29, v32);
          CGFloat x = v30.origin.x;
          CGFloat y = v30.origin.y;
          CGFloat width = v30.size.width;
          CGFloat height = v30.size.height;
        }

        ++v12;
      }
      while (v10 != v12);
      uint64_t v10 = [v9 countByEnumeratingWithState:&v23 objects:v27 count:16];
    }
    while (v10);
  }

  double v19 = x;
  double v20 = y;
  double v21 = width;
  double v22 = height;
  result.size.CGFloat height = v22;
  result.size.CGFloat width = v21;
  result.origin.CGFloat y = v20;
  result.origin.CGFloat x = v19;
  return result;
}

- (CGPoint)centroidForSlicesWithIdentifiers:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [v4 count];
  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v24;
    double v9 = 0.0;
    double v10 = 0.0;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v24 != v8) {
          objc_enumerationMutation(v6);
        }
        uint64_t v12 = -[PKStrokeProvider sliceForIdentifier:](self, "sliceForIdentifier:", *(void *)(*((void *)&v23 + 1) + 8 * i), (void)v23);
        v13 = v12;
        if (v12)
        {
          [v12 bounds];
          CGFloat x = v30.origin.x;
          CGFloat y = v30.origin.y;
          CGFloat width = v30.size.width;
          CGFloat height = v30.size.height;
          double MidX = CGRectGetMidX(v30);
          v31.origin.CGFloat x = x;
          v31.origin.CGFloat y = y;
          v31.size.CGFloat width = width;
          v31.size.CGFloat height = height;
          double v10 = v10 + MidX;
          double v9 = v9 + CGRectGetMidY(v31);
        }
        else
        {
          --v5;
        }
      }
      uint64_t v7 = [v6 countByEnumeratingWithState:&v23 objects:v27 count:16];
    }
    while (v7);
  }
  else
  {
    double v9 = 0.0;
    double v10 = 0.0;
  }

  if (v5 < 1)
  {
    double v19 = *MEMORY[0x1E4F1DAD8];
    double v20 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
  }
  else
  {
    double v19 = v10 / (double)v5;
    double v20 = v9 / (double)v5;
  }

  double v21 = v19;
  double v22 = v20;
  result.CGFloat y = v22;
  result.CGFloat x = v21;
  return result;
}

- (CGPoint)startingPointForSlicesWithIdentifiers:(id)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v22 = 0;
  long long v23 = (double *)&v22;
  uint64_t v24 = 0x4012000000;
  long long v25 = __Block_byref_object_copy__22;
  long long v26 = __Block_byref_object_dispose__22;
  v27 = "";
  long long v28 = *MEMORY[0x1E4F1DAD8];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v5 = v4;
  id v6 = 0;
  uint64_t v7 = [v5 countByEnumeratingWithState:&v18 objects:v29 count:16];
  if (!v7)
  {
    uint64_t v12 = v5;
    goto LABEL_15;
  }
  uint64_t v8 = *(void *)v19;
  do
  {
    for (uint64_t i = 0; i != v7; ++i)
    {
      if (*(void *)v19 != v8) {
        objc_enumerationMutation(v5);
      }
      double v10 = *(void **)(*((void *)&v18 + 1) + 8 * i);
      if (v6)
      {
        if ([(PKStrokeProvider *)self compareOrderOfStrokeWithIdentifier:v6 toStrokeWithIdentifier:*(void *)(*((void *)&v18 + 1) + 8 * i)] == 1)
        {
          id v11 = v10;

          id v6 = v11;
        }
      }
      else
      {
        id v6 = v10;
      }
    }
    uint64_t v7 = [v5 countByEnumeratingWithState:&v18 objects:v29 count:16];
  }
  while (v7);

  if (v6)
  {
    uint64_t v12 = [(PKStrokeProvider *)self sliceForIdentifier:v6];
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __67__PKTextInputStrokeProvider_startingPointForSlicesWithIdentifiers___block_invoke;
    v17[3] = &unk_1E64C59C8;
    v17[4] = &v22;
    [v12 enumeratePointsWithDistanceStep:v17 usingBlock:1.0];
LABEL_15:
  }
  double v13 = v23[6];
  double v14 = v23[7];

  _Block_object_dispose(&v22, 8);
  double v15 = v13;
  double v16 = v14;
  result.CGFloat y = v16;
  result.CGFloat x = v15;
  return result;
}

uint64_t __67__PKTextInputStrokeProvider_startingPointForSlicesWithIdentifiers___block_invoke(uint64_t result, unsigned char *a2, double a3, double a4)
{
  uint64_t v4 = *(void *)(*(void *)(result + 32) + 8);
  *(double *)(v4 + 48) = a3;
  *(double *)(v4 + 56) = a4;
  *a2 = 1;
  return result;
}

- (BOOL)slicesWithIdentifiers:(id)a3 significantlyOverlapRect:(CGRect)a4
{
  CGFloat height = a4.size.height;
  CGFloat width = a4.size.width;
  CGFloat y = a4.origin.y;
  CGFloat x = a4.origin.x;
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  [(PKTextInputStrokeProvider *)self boundsForSliceIdentifiers:v9];
  *(CGFloat *)r2 = x;
  v43.origin.CGFloat x = x;
  v43.origin.CGFloat y = y;
  v43.size.CGFloat width = width;
  v43.size.CGFloat height = height;
  if (CGRectIntersectsRect(v36, v43))
  {
    id v30 = v9;
    uint64_t v10 = [v9 count];
    long long v32 = 0u;
    long long v33 = 0u;
    memset(&r2[1], 0, 32);
    id v11 = v9;
    uint64_t v12 = [v11 countByEnumeratingWithState:&r2[1] objects:v34 count:16];
    if (v12)
    {
      uint64_t v13 = 0;
      uint64_t v14 = 0;
      int64_t v15 = llround((double)v10 * 0.7);
      uint64_t v16 = v10 - v15;
      uint64_t v17 = *(void *)r2[3];
LABEL_4:
      uint64_t v18 = 0;
      while (1)
      {
        if (*(void *)r2[3] != v17) {
          objc_enumerationMutation(v11);
        }
        long long v19 = [(PKStrokeProvider *)self sliceForIdentifier:*(void *)(r2[2] + 8 * v18)];
        [v19 bounds];
        CGFloat v20 = v37.origin.x;
        CGFloat v21 = v37.origin.y;
        CGFloat v22 = v37.size.width;
        CGFloat v23 = v37.size.height;
        if (CGRectGetHeight(v37) > 0.0)
        {
          v38.origin.CGFloat x = v20;
          v38.origin.CGFloat y = v21;
          v38.size.CGFloat width = v22;
          v38.size.CGFloat height = v23;
          if (CGRectGetWidth(v38) > 0.0)
          {
            v39.origin.CGFloat x = v20;
            v39.origin.CGFloat y = v21;
            v39.size.CGFloat width = v22;
            v39.size.CGFloat height = v23;
            *(void *)&v44.origin.CGFloat x = r2[0];
            v44.origin.CGFloat y = y;
            v44.size.CGFloat width = width;
            v44.size.CGFloat height = height;
            CGRect v40 = CGRectIntersection(v39, v44);
            double v24 = CGRectGetHeight(v40);
            v41.origin.CGFloat x = v20;
            v41.origin.CGFloat y = v21;
            v41.size.CGFloat width = v22;
            v41.size.CGFloat height = v23;
            double v25 = CGRectGetHeight(v41);
            *(void *)&v42.origin.CGFloat x = r2[0];
            v42.origin.CGFloat y = y;
            v42.size.CGFloat width = width;
            v42.size.CGFloat height = height;
            double v26 = CGRectGetHeight(v42);
            if (v24 / v25 >= 0.6 || v24 / v26 >= 0.6)
            {
              if (++v14 >= v15)
              {
                int v27 = 1;
                goto LABEL_20;
              }
            }
            else
            {
              if (v13 >= v16)
              {
                int v27 = 0;
LABEL_20:

                goto LABEL_21;
              }
              ++v13;
            }
          }
        }

        if (v12 == ++v18)
        {
          uint64_t v12 = [v11 countByEnumeratingWithState:&r2[1] objects:v34 count:16];
          if (v12) {
            goto LABEL_4;
          }
          break;
        }
      }
    }
    int v27 = 0;
LABEL_21:

    BOOL v28 = v27 != 0;
    id v9 = v30;
  }
  else
  {
    BOOL v28 = 0;
  }

  return v28;
}

- (BOOL)containsStrokeWithUUID:(id)a3
{
  id v4 = a3;
  id v5 = [(PKStrokeProvider *)self drawing];
  id v6 = [v5 _visibleStrokeForIdentifier:v4];

  return v6 != 0;
}

- (id)strokesForSliceIdentifiers:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [MEMORY[0x1E4F1CA80] set];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v6);
        }
        uint64_t v10 = -[PKStrokeProvider sliceForIdentifier:](self, "sliceForIdentifier:", *(void *)(*((void *)&v13 + 1) + 8 * i), (void)v13);
        id v11 = [v10 stroke];
        if (v11) {
          [v5 addObject:v11];
        }
      }
      uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v7);
  }

  return v5;
}

- (void).cxx_destruct
{
}

@end