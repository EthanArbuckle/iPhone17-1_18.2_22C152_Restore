@interface MPVolumeGroupSliderCoordinator
- (BOOL)synced;
- (MPVolumeGroupSliderCoordinator)initWithMasterVolumeSlider:(id)a3 individualVolumeSliders:(id)a4;
- (MPVolumeSlider)masterVolumeSlider;
- (NSArray)individualVolumeSliders;
- (float)_maxOptimisticValue;
- (id)_findExistingVolumeSlider:(id)a3;
- (void)_addControlEventsForVolumeSlider:(id)a3;
- (void)_addControlEventsForVolumeSliders:(id)a3;
- (void)_removeControlEventsForVolumeSlider:(id)a3;
- (void)_removeControlEventsForVolumeSliders:(id)a3;
- (void)_resetMasterVolumeSlider;
- (void)_resetOptimisticScales;
- (void)_setControlEventsForVolumeSlider:(id)a3 add:(BOOL)a4;
- (void)_updateOptimisticValueCache;
- (void)addIndividualVolumeSlider:(id)a3;
- (void)removeAllIndividualVolumeSliders;
- (void)removeIndividualVolumeSlider:(id)a3;
- (void)syncSliders:(BOOL)a3;
- (void)volumeSliderDidEndTracking:(id)a3;
- (void)volumeSliderValueChanged:(id)a3;
@end

@implementation MPVolumeGroupSliderCoordinator

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_masterVolumeSlider, 0);
  objc_storeStrong((id *)&self->_optimisticScales, 0);
  objc_storeStrong((id *)&self->_optimisticValues, 0);
  objc_storeStrong((id *)&self->_trackingSlider, 0);
  objc_storeStrong((id *)&self->_individualVolumeSliders, 0);

  objc_storeStrong((id *)&self->_allSliders, 0);
}

- (BOOL)synced
{
  return self->_synced;
}

- (MPVolumeSlider)masterVolumeSlider
{
  return self->_masterVolumeSlider;
}

- (void)_setControlEventsForVolumeSlider:(id)a3 add:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  if (v4)
  {
    [v6 addTarget:self action:sel_volumeSliderValueChanged_ forControlEvents:4096];
    [v6 addTarget:self action:sel_volumeSliderDidEndTracking_ forControlEvents:448];
  }
  else
  {
    [v6 removeTarget:self action:sel_volumeSliderValueChanged_ forControlEvents:4096];
    [v6 removeTarget:self action:sel_volumeSliderDidEndTracking_ forControlEvents:448];
  }
}

- (void)_removeControlEventsForVolumeSliders:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v10;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v4);
        }
        [(MPVolumeGroupSliderCoordinator *)self _setControlEventsForVolumeSlider:*(void *)(*((void *)&v9 + 1) + 8 * v8++) add:0];
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }
}

- (void)_removeControlEventsForVolumeSlider:(id)a3
{
}

- (void)_addControlEventsForVolumeSliders:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v10;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v4);
        }
        [(MPVolumeGroupSliderCoordinator *)self _setControlEventsForVolumeSlider:*(void *)(*((void *)&v9 + 1) + 8 * v8++) add:1];
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }
}

- (void)_addControlEventsForVolumeSlider:(id)a3
{
}

- (id)_findExistingVolumeSlider:(id)a3
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  obj = self->_individualVolumeSliders;
  uint64_t v28 = [(NSMutableSet *)obj countByEnumeratingWithState:&v35 objects:v40 count:16];
  if (v28)
  {
    uint64_t v6 = *(void *)v36;
    uint64_t v25 = *(void *)v36;
    id v26 = v5;
LABEL_3:
    uint64_t v7 = 0;
    while (1)
    {
      if (*(void *)v36 != v6) {
        objc_enumerationMutation(obj);
      }
      id v8 = *(id *)(*((void *)&v35 + 1) + 8 * v7);
      if (v8 != v5)
      {
        long long v9 = [*(id *)(*((void *)&v35 + 1) + 8 * v7) volumeController];
        long long v10 = [v9 dataSource];

        long long v11 = [v5 volumeController];
        long long v12 = [v11 dataSource];

        v30 = v10;
        v13 = [v10 outputDeviceRoute];
        v29 = v12;
        uint64_t v14 = [v12 outputDeviceRoute];
        v15 = [v13 routeUID];
        long long v31 = 0u;
        long long v32 = 0u;
        long long v33 = 0u;
        long long v34 = 0u;
        v16 = [v14 outputDevices];
        uint64_t v17 = [v16 countByEnumeratingWithState:&v31 objects:v39 count:16];
        if (v17)
        {
          uint64_t v18 = v17;
          id v24 = v3;
          uint64_t v19 = *(void *)v32;
          while (2)
          {
            for (uint64_t i = 0; i != v18; ++i)
            {
              if (*(void *)v32 != v19) {
                objc_enumerationMutation(v16);
              }
              v21 = (void *)MRAVOutputDeviceCopyUniqueIdentifier();
              if ([v21 isEqualToString:v15])
              {
                id v3 = v8;

                int v22 = 0;
                id v5 = v26;
                goto LABEL_17;
              }
            }
            uint64_t v18 = [v16 countByEnumeratingWithState:&v31 objects:v39 count:16];
            if (v18) {
              continue;
            }
            break;
          }
          int v22 = 1;
          id v5 = v26;
          id v3 = v24;
LABEL_17:
          uint64_t v6 = v25;
        }
        else
        {
          int v22 = 1;
        }

        if (!v22) {
          break;
        }
      }
      if (++v7 == v28)
      {
        uint64_t v28 = [(NSMutableSet *)obj countByEnumeratingWithState:&v35 objects:v40 count:16];
        if (v28) {
          goto LABEL_3;
        }
        goto LABEL_22;
      }
    }
  }
  else
  {
LABEL_22:
    id v3 = 0;
  }

  return v3;
}

- (void)syncSliders:(BOOL)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  if (!self->_synced)
  {
    id v4 = -[MPCubicSpringTimingParameters initWithMass:stiffness:damping:initialVelocity:]([MPCubicSpringTimingParameters alloc], "initWithMass:stiffness:damping:initialVelocity:", 2.0, 300.0, 36.0, 0.0, 0.0);
    id v5 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB1698]), "initWithControlPoint1:controlPoint2:", 0.187800005, 0.00230000005, 0.539900005, 0.962899983);
    [(MPCubicSpringTimingParameters *)v4 setSpringCubicTimingParameters:v5];

    uint64_t v6 = [(UIViewPropertyAnimator *)[MPCubicSpringAnimator alloc] initWithDuration:v4 timingParameters:1.0];
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    obj = self->_individualVolumeSliders;
    uint64_t v7 = [(NSMutableSet *)obj countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v16;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v16 != v9) {
            objc_enumerationMutation(obj);
          }
          long long v11 = *(void **)(*((void *)&v15 + 1) + 8 * i);
          [v11 setOptimisticState:0];
          v14[0] = MEMORY[0x1E4F143A8];
          v14[1] = 3221225472;
          v14[2] = __46__MPVolumeGroupSliderCoordinator_syncSliders___block_invoke;
          v14[3] = &unk_1E57F9F98;
          v14[4] = v11;
          v14[5] = self;
          [(UIViewPropertyAnimator *)v6 addAnimations:v14];
          v13[0] = MEMORY[0x1E4F143A8];
          v13[1] = 3221225472;
          v13[2] = __46__MPVolumeGroupSliderCoordinator_syncSliders___block_invoke_2;
          v13[3] = &unk_1E57F3380;
          v13[4] = v11;
          [(UIViewPropertyAnimator *)v6 addCompletion:v13];
        }
        uint64_t v8 = [(NSMutableSet *)obj countByEnumeratingWithState:&v15 objects:v19 count:16];
      }
      while (v8);
    }

    [(UIViewPropertyAnimator *)v6 startAnimation];
    self->_synced = 1;
    [(MPVolumeGroupSliderCoordinator *)self _updateOptimisticValueCache];
  }
}

uint64_t __46__MPVolumeGroupSliderCoordinator_syncSliders___block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  [*(id *)(*(void *)(a1 + 40) + 56) optimisticValue];

  return objc_msgSend(v1, "setValue:animated:", 1);
}

uint64_t __46__MPVolumeGroupSliderCoordinator_syncSliders___block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) value];
  v2 = *(void **)(a1 + 32);

  return objc_msgSend(v2, "setOptimisticValue:");
}

- (void)_resetMasterVolumeSlider
{
  [(MPVolumeSlider *)self->_masterVolumeSlider setOptimisticState:1];
  id v3 = [(MPVolumeSlider *)self->_masterVolumeSlider volumeController];
  [v3 volumeValue];
  -[MPVolumeSlider setOptimisticValue:](self->_masterVolumeSlider, "setOptimisticValue:");

  masterVolumeSlider = self->_masterVolumeSlider;

  [(MPVolumeSlider *)masterVolumeSlider setOptimisticState:0];
}

- (void)_updateOptimisticValueCache
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  trackingSlider = self->_trackingSlider;
  if (trackingSlider == self->_masterVolumeSlider
    && ([(MPVolumeSlider *)trackingSlider optimisticValue], v4 <= 0.00000011921))
  {
    v13 = os_log_create("com.apple.amp.mediaplayer", "Volume");
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1952E8000, v13, OS_LOG_TYPE_DEFAULT, "Do not update optimistic value cache since master volume was set to 0.", buf, 2u);
    }
  }
  else
  {
    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    id v5 = self->_allSliders;
    uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v14 objects:v19 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v15;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v15 != v8) {
            objc_enumerationMutation(v5);
          }
          long long v10 = *(void **)(*((void *)&v14 + 1) + 8 * i);
          long long v11 = NSNumber;
          objc_msgSend(v10, "value", (void)v14);
          long long v12 = objc_msgSend(v11, "numberWithFloat:");
          [(NSMapTable *)self->_optimisticValues setObject:v12 forKey:v10];
        }
        uint64_t v7 = [(NSArray *)v5 countByEnumeratingWithState:&v14 objects:v19 count:16];
      }
      while (v7);
    }

    [(MPVolumeGroupSliderCoordinator *)self _resetOptimisticScales];
  }
}

- (void)_resetOptimisticScales
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v3 = NSNumber;
  [(MPVolumeGroupSliderCoordinator *)self _maxOptimisticValue];
  uint64_t v25 = objc_msgSend(v3, "numberWithFloat:");
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  float v4 = self->_individualVolumeSliders;
  uint64_t v5 = [(NSMutableSet *)v4 countByEnumeratingWithState:&v30 objects:v35 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = 0;
    uint64_t v8 = 0;
    uint64_t v9 = *(void *)v31;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v31 != v9) {
          objc_enumerationMutation(v4);
        }
        long long v11 = *(MPVolumeSlider **)(*((void *)&v30 + 1) + 8 * i);
        long long v12 = [(NSMapTable *)self->_optimisticValues objectForKey:v11];
        [v12 floatValue];
        double v14 = v13;
        if (v14 >= 0.0000101192093)
        {
          [v12 floatValue];
          float v18 = v17;
          [v25 floatValue];
          float v16 = v18 / *(float *)&v14;
        }
        else
        {
          masterVolumeSlider = self->_masterVolumeSlider;
          if (v11 == masterVolumeSlider) {
            float v16 = 1.0;
          }
          else {
            float v16 = 0.0;
          }
          if (v11 != masterVolumeSlider) {
            ++v8;
          }
        }
        *(float *)&double v14 = v16;
        uint64_t v19 = [NSNumber numberWithFloat:v14];
        [(NSMapTable *)self->_optimisticScales setObject:v19 forKey:v11];
        if (v16 <= 0.00000011921) {
          ++v7;
        }
      }
      uint64_t v6 = [(NSMutableSet *)v4 countByEnumeratingWithState:&v30 objects:v35 count:16];
    }
    while (v6);
  }
  else
  {
    uint64_t v7 = 0;
    uint64_t v8 = 0;
  }

  [(NSMapTable *)self->_optimisticScales setObject:&unk_1EE6EE3D0 forKey:self->_masterVolumeSlider];
  if (v7 == [(NSMutableSet *)self->_individualVolumeSliders count])
  {
    long long v28 = 0u;
    long long v29 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    uint64_t v20 = self->_individualVolumeSliders;
    uint64_t v21 = [(NSMutableSet *)v20 countByEnumeratingWithState:&v26 objects:v34 count:16];
    if (v21)
    {
      uint64_t v22 = v21;
      uint64_t v23 = *(void *)v27;
      do
      {
        for (uint64_t j = 0; j != v22; ++j)
        {
          if (*(void *)v27 != v23) {
            objc_enumerationMutation(v20);
          }
          [(NSMapTable *)self->_optimisticScales setObject:&unk_1EE6EE3D0 forKey:*(void *)(*((void *)&v26 + 1) + 8 * j)];
        }
        uint64_t v22 = [(NSMutableSet *)v20 countByEnumeratingWithState:&v26 objects:v34 count:16];
      }
      while (v22);
    }
  }
  else if (v8 == [(NSMutableSet *)self->_individualVolumeSliders count] {
         && self->_trackingSlider != self->_masterVolumeSlider)
  }
  {
    -[NSMapTable setObject:forKey:](self->_optimisticScales, "setObject:forKey:", &unk_1EE6EE3D0);
  }
}

- (float)_maxOptimisticValue
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v3 = [(NSMapTable *)self->_optimisticValues keyEnumerator];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v14;
    float v7 = 0.0;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v14 != v6) {
          objc_enumerationMutation(v3);
        }
        if (*(MPVolumeSlider **)(*((void *)&v13 + 1) + 8 * i) != self->_masterVolumeSlider)
        {
          uint64_t v9 = -[NSMapTable objectForKey:](self->_optimisticValues, "objectForKey:");
          [v9 floatValue];
          float v11 = v10;

          if (v11 > v7) {
            float v7 = v11;
          }
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v5);
  }
  else
  {
    float v7 = 0.0;
  }

  return v7;
}

- (void)volumeSliderDidEndTracking:(id)a3
{
  uint64_t v64 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = (MPVolumeSlider *)a3;
  uint64_t v5 = v4;
  trackingSlider = self->_trackingSlider;
  if (trackingSlider == v4)
  {
    if (self->_masterVolumeSlider == v4 && ([(MPVolumeSlider *)v4 value], v7 <= 0.00000011921))
    {
      v44 = v5;
      long long v54 = 0u;
      long long v55 = 0u;
      long long v52 = 0u;
      long long v53 = 0u;
      long long v28 = self->_allSliders;
      uint64_t v29 = [(NSArray *)v28 countByEnumeratingWithState:&v52 objects:v63 count:16];
      if (v29)
      {
        uint64_t v30 = v29;
        uint64_t v31 = *(void *)v53;
        do
        {
          for (uint64_t i = 0; i != v30; ++i)
          {
            if (*(void *)v53 != v31) {
              objc_enumerationMutation(v28);
            }
            long long v33 = *(MPVolumeSlider **)(*((void *)&v52 + 1) + 8 * i);
            [(MPVolumeSlider *)v33 setOptimisticState:0];
            if (v33 != self->_masterVolumeSlider)
            {
              long long v34 = os_log_create("com.apple.amp.mediaplayer", "Volume");
              if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
              {
                [(MPVolumeSlider *)v33 value];
                double v36 = v35;
                [(MPVolumeSlider *)v33 optimisticValue];
                double v38 = v37;
                v39 = [(MPVolumeSlider *)v33 volumeControlLabel];
                *(_DWORD *)buf = 134218498;
                double v58 = v36;
                __int16 v59 = 2048;
                double v60 = v38;
                __int16 v61 = 2114;
                v62 = v39;
                _os_log_impl(&dword_1952E8000, v34, OS_LOG_TYPE_DEFAULT, "MPVolumeGroupSliderCoordinator changing %f to %f for %{public}@", buf, 0x20u);
              }
              [(MPVolumeSlider *)v33 optimisticValue];
              -[MPVolumeSlider setValue:](v33, "setValue:");
            }
          }
          uint64_t v30 = [(NSArray *)v28 countByEnumeratingWithState:&v52 objects:v63 count:16];
        }
        while (v30);
      }

      v40 = self->_trackingSlider;
      self->_trackingSlider = 0;

      uint64_t v41 = os_log_create("com.apple.amp.mediaplayer", "Volume");
      if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1952E8000, v41, OS_LOG_TYPE_DEFAULT, "End optimistic state.", buf, 2u);
      }

      uint64_t v5 = v44;
    }
    else
    {
      self->_shouldOverrideTracking = 1;
      [(MPVolumeGroupSliderCoordinator *)self volumeSliderValueChanged:v5];
      self->_shouldOverrideTracking = 0;
      uint64_t v8 = self->_trackingSlider;
      self->_trackingSlider = 0;

      uint64_t v9 = -[MPCubicSpringTimingParameters initWithMass:stiffness:damping:initialVelocity:]([MPCubicSpringTimingParameters alloc], "initWithMass:stiffness:damping:initialVelocity:", 2.0, 300.0, 28.0, 0.0, 0.0);
      float v10 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB1698]), "initWithControlPoint1:controlPoint2:", 0.187800005, 0.00230000005, 0.539900005, 0.962899983);
      [(MPCubicSpringTimingParameters *)v9 setSpringCubicTimingParameters:v10];

      float v11 = [(UIViewPropertyAnimator *)[MPCubicSpringAnimator alloc] initWithDuration:v9 timingParameters:0.3];
      long long v48 = 0u;
      long long v49 = 0u;
      long long v50 = 0u;
      long long v51 = 0u;
      long long v12 = self->_optimisticScales;
      uint64_t v13 = [(NSMapTable *)v12 countByEnumeratingWithState:&v48 objects:v56 count:16];
      if (v13)
      {
        uint64_t v14 = v13;
        v42 = v9;
        v43 = v5;
        char v15 = 0;
        uint64_t v16 = *(void *)v49;
        do
        {
          for (uint64_t j = 0; j != v14; ++j)
          {
            if (*(void *)v49 != v16) {
              objc_enumerationMutation(v12);
            }
            uint64_t v18 = *(MPVolumeSlider **)(*((void *)&v48 + 1) + 8 * j);
            uint64_t v19 = -[NSMapTable objectForKey:](self->_optimisticScales, "objectForKey:", v18, v42);
            [v19 floatValue];
            float v21 = v20;

            uint64_t v22 = [(NSMapTable *)self->_optimisticScales objectForKey:v18];
            [v22 floatValue];
            float v24 = v23;

            if (v18 != self->_masterVolumeSlider)
            {
              float v25 = v21 + -1.0;
              if ((float)(v21 + -1.0) < 0.0) {
                float v25 = -(float)(v21 + -1.0);
              }
              if (v25 <= 0.0999998808 && v24 != 1.0)
              {
                [(MPVolumeSlider *)v18 setOptimisticState:0];
                v47[0] = MEMORY[0x1E4F143A8];
                v47[1] = 3221225472;
                v47[2] = __61__MPVolumeGroupSliderCoordinator_volumeSliderDidEndTracking___block_invoke;
                v47[3] = &unk_1E57F9F98;
                v47[4] = v18;
                v47[5] = self;
                [(UIViewPropertyAnimator *)v11 addAnimations:v47];
                v46[0] = MEMORY[0x1E4F143A8];
                v46[1] = 3221225472;
                v46[2] = __61__MPVolumeGroupSliderCoordinator_volumeSliderDidEndTracking___block_invoke_2;
                v46[3] = &unk_1E57F3380;
                v46[4] = v18;
                [(UIViewPropertyAnimator *)v11 addCompletion:v46];
                char v15 = 1;
                self->_synced = 1;
              }
            }
          }
          uint64_t v14 = [(NSMapTable *)v12 countByEnumeratingWithState:&v48 objects:v56 count:16];
        }
        while (v14);

        uint64_t v9 = v42;
        uint64_t v5 = v43;
        if (v15) {
          [(UIViewPropertyAnimator *)v11 startAnimation];
        }
      }
      else
      {
      }
      ++self->_inFlightDisableOptimisticStateRequests;
      dispatch_time_t v27 = dispatch_time(0, 2000000000);
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __61__MPVolumeGroupSliderCoordinator_volumeSliderDidEndTracking___block_invoke_3;
      block[3] = &unk_1E57F9EA8;
      block[4] = self;
      dispatch_after(v27, MEMORY[0x1E4F14428], block);
    }
  }
  else
  {
    self->_trackingSlider = 0;
  }
}

uint64_t __61__MPVolumeGroupSliderCoordinator_volumeSliderDidEndTracking___block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  [*(id *)(*(void *)(a1 + 40) + 56) value];

  return objc_msgSend(v1, "setValue:animated:", 1);
}

uint64_t __61__MPVolumeGroupSliderCoordinator_volumeSliderDidEndTracking___block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) value];
  v2 = *(void **)(a1 + 32);

  return objc_msgSend(v2, "setOptimisticValue:");
}

void __61__MPVolumeGroupSliderCoordinator_volumeSliderDidEndTracking___block_invoke_3(uint64_t a1)
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  --*(_DWORD *)(*(void *)(a1 + 32) + 48);
  uint64_t v1 = *(void *)(a1 + 32);
  if (!*(_DWORD *)(v1 + 48) && !*(void *)(v1 + 24))
  {
    id v3 = os_log_create("com.apple.amp.mediaplayer", "Volume");
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1952E8000, v3, OS_LOG_TYPE_DEFAULT, "Committing optimistic values", buf, 2u);
    }

    long long v22 = 0u;
    long long v23 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    id v4 = *(id *)(*(void *)(a1 + 32) + 8);
    uint64_t v5 = [v4 countByEnumeratingWithState:&v20 objects:v30 count:16];
    if (v5)
    {
      uint64_t v7 = v5;
      uint64_t v8 = *(void *)v21;
      *(void *)&long long v6 = 134218498;
      long long v19 = v6;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v21 != v8) {
            objc_enumerationMutation(v4);
          }
          float v10 = *(void **)(*((void *)&v20 + 1) + 8 * i);
          objc_msgSend(v10, "setOptimisticState:", 0, v19, (void)v20);
          float v11 = *(void **)(a1 + 32);
          if (v10 != (void *)v11[7])
          {
            long long v12 = os_log_create("com.apple.amp.mediaplayer", "Volume");
            if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
            {
              [v10 value];
              double v14 = v13;
              [v10 optimisticValue];
              double v16 = v15;
              float v17 = [v10 volumeControlLabel];
              *(_DWORD *)buf = v19;
              double v25 = v14;
              __int16 v26 = 2048;
              double v27 = v16;
              __int16 v28 = 2114;
              uint64_t v29 = v17;
              _os_log_impl(&dword_1952E8000, v12, OS_LOG_TYPE_DEFAULT, "MPVolumeGroupSliderCoordinator changing %f to %f for %{public}@", buf, 0x20u);
            }
            [v10 optimisticValue];
            objc_msgSend(v10, "setValue:");
            float v11 = *(void **)(a1 + 32);
          }
          [v11 _resetMasterVolumeSlider];
        }
        uint64_t v7 = [v4 countByEnumeratingWithState:&v20 objects:v30 count:16];
      }
      while (v7);
    }

    uint64_t v18 = os_log_create("com.apple.amp.mediaplayer", "Volume");
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1952E8000, v18, OS_LOG_TYPE_DEFAULT, "End optimistic state.", buf, 2u);
    }
  }
}

- (void)volumeSliderValueChanged:(id)a3
{
  uint64_t v74 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (([v6 isTracking] & 1) == 0 && !self->_shouldOverrideTracking) {
    goto LABEL_48;
  }
  long long v66 = 0u;
  long long v67 = 0u;
  long long v64 = 0u;
  long long v65 = 0u;
  uint64_t v7 = [(NSMapTable *)self->_optimisticScales objectEnumerator];
  uint64_t v8 = [v7 countByEnumeratingWithState:&v64 objects:v73 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v65;
    while (2)
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v65 != v10) {
          objc_enumerationMutation(v7);
        }
        [*(id *)(*((void *)&v64 + 1) + 8 * i) floatValue];
        if (fabs(v12 + -0.999999881) >= 0.0999998808)
        {
          self->_synced = 0;
          goto LABEL_13;
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v64 objects:v73 count:16];
      if (v9) {
        continue;
      }
      break;
    }
  }
LABEL_13:

  trackingSlider = self->_trackingSlider;
  if (!trackingSlider)
  {
    if (self->_shouldOverrideTracking)
    {
      trackingSlider = 0;
    }
    else
    {
      objc_storeStrong((id *)&self->_trackingSlider, a3);
      double v14 = os_log_create("com.apple.amp.mediaplayer", "Volume");
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v15 = [(NSMutableSet *)self->_individualVolumeSliders count];
        *(_DWORD *)buf = 134217984;
        uint64_t v72 = v15;
        _os_log_impl(&dword_1952E8000, v14, OS_LOG_TYPE_DEFAULT, "Begin optimistic state with %lu individual sliders", buf, 0xCu);
      }

      [(MPVolumeGroupSliderCoordinator *)self _updateOptimisticValueCache];
      trackingSlider = self->_trackingSlider;
    }
  }
  int v16 = [(NSMutableSet *)self->_individualVolumeSliders containsObject:trackingSlider];
  int v17 = v16;
  uint64_t v18 = self->_trackingSlider;
  masterVolumeSlider = self->_masterVolumeSlider;
  if (v18 != masterVolumeSlider && (v16 & 1) == 0)
  {
    long long v51 = [MEMORY[0x1E4F28B00] currentHandler];
    [v51 handleFailureInMethod:a2 object:self file:@"MPVolumeGroupSliderCoordinator.m" lineNumber:134 description:@"We don't have a master or individual slider."];
  }
  long long v62 = 0u;
  long long v63 = 0u;
  long long v60 = 0u;
  long long v61 = 0u;
  long long v20 = self->_allSliders;
  uint64_t v21 = [(NSArray *)v20 countByEnumeratingWithState:&v60 objects:v70 count:16];
  if (v21)
  {
    uint64_t v22 = v21;
    uint64_t v23 = *(void *)v61;
    do
    {
      for (uint64_t j = 0; j != v22; ++j)
      {
        if (*(void *)v61 != v23) {
          objc_enumerationMutation(v20);
        }
        [*(id *)(*((void *)&v60 + 1) + 8 * j) setOptimisticState:*(MPVolumeSlider **)(*((void *)&v60 + 1) + 8 * j) != self->_trackingSlider];
      }
      uint64_t v22 = [(NSArray *)v20 countByEnumeratingWithState:&v60 objects:v70 count:16];
    }
    while (v22);
  }

  if (v18 == masterVolumeSlider)
  {
    uint64_t v29 = NSNumber;
    [v6 value];
    __int16 v26 = objc_msgSend(v29, "numberWithFloat:");
    [(NSMapTable *)self->_optimisticValues setObject:v26 forKey:v6];
    long long v58 = 0u;
    long long v59 = 0u;
    long long v56 = 0u;
    long long v57 = 0u;
    __int16 v28 = self->_individualVolumeSliders;
    uint64_t v30 = [(NSMutableSet *)v28 countByEnumeratingWithState:&v56 objects:v69 count:16];
    if (v30)
    {
      uint64_t v31 = v30;
      uint64_t v32 = *(void *)v57;
      do
      {
        for (uint64_t k = 0; k != v31; ++k)
        {
          if (*(void *)v57 != v32) {
            objc_enumerationMutation(v28);
          }
          uint64_t v34 = *(void *)(*((void *)&v56 + 1) + 8 * k);
          float v35 = [(NSMapTable *)self->_optimisticScales objectForKey:v34];
          [v35 floatValue];
          float v37 = v36;

          [v6 value];
          *(float *)&double v39 = v37 * v38;
          v40 = [NSNumber numberWithFloat:v39];
          [(NSMapTable *)self->_optimisticValues setObject:v40 forKey:v34];
        }
        uint64_t v31 = [(NSMutableSet *)v28 countByEnumeratingWithState:&v56 objects:v69 count:16];
      }
      while (v31);
    }
    goto LABEL_39;
  }
  if (v17)
  {
    double v25 = NSNumber;
    [v6 value];
    __int16 v26 = objc_msgSend(v25, "numberWithFloat:");
    [(NSMapTable *)self->_optimisticValues setObject:v26 forKey:v6];
    double v27 = NSNumber;
    [(MPVolumeGroupSliderCoordinator *)self _maxOptimisticValue];
    objc_msgSend(v27, "numberWithFloat:");
    __int16 v28 = (NSMutableSet *)objc_claimAutoreleasedReturnValue();
    [(NSMapTable *)self->_optimisticValues setObject:v28 forKey:self->_masterVolumeSlider];
    [(MPVolumeGroupSliderCoordinator *)self _resetOptimisticScales];
LABEL_39:
  }
  long long v54 = 0u;
  long long v55 = 0u;
  long long v52 = 0u;
  long long v53 = 0u;
  uint64_t v41 = self->_allSliders;
  uint64_t v42 = [(NSArray *)v41 countByEnumeratingWithState:&v52 objects:v68 count:16];
  if (v42)
  {
    uint64_t v43 = v42;
    uint64_t v44 = *(void *)v53;
    do
    {
      for (uint64_t m = 0; m != v43; ++m)
      {
        if (*(void *)v53 != v44) {
          objc_enumerationMutation(v41);
        }
        v46 = *(void **)(*((void *)&v52 + 1) + 8 * m);
        v47 = -[NSMapTable objectForKey:](self->_optimisticValues, "objectForKey:", v46, (void)v52);
        [v47 floatValue];
        int v49 = v48;

        LODWORD(v50) = v49;
        [v46 setOptimisticValue:v50];
      }
      uint64_t v43 = [(NSArray *)v41 countByEnumeratingWithState:&v52 objects:v68 count:16];
    }
    while (v43);
  }

LABEL_48:
}

- (void)removeAllIndividualVolumeSliders
{
  [(NSMutableSet *)self->_individualVolumeSliders removeAllObjects];
  [(NSMapTable *)self->_optimisticScales removeAllObjects];
  optimisticValues = self->_optimisticValues;

  [(NSMapTable *)optimisticValues removeAllObjects];
}

- (void)removeIndividualVolumeSlider:(id)a3
{
  id v8 = a3;
  int AppBooleanValue = CFPreferencesGetAppBooleanValue(@"WHAOptimisticStateVolumeDisabled", @"com.apple.Music", 0);
  if (v8 && !AppBooleanValue)
  {
    [(NSMapTable *)self->_optimisticValues removeObjectForKey:v8];
    [(NSMapTable *)self->_optimisticScales removeObjectForKey:v8];
    [(NSMutableSet *)self->_individualVolumeSliders removeObject:v8];
    uint64_t v5 = [(NSMutableSet *)self->_individualVolumeSliders setByAddingObject:self->_masterVolumeSlider];
    id v6 = [v5 allObjects];
    allSliders = self->_allSliders;
    self->_allSliders = v6;

    [(MPVolumeGroupSliderCoordinator *)self _removeControlEventsForVolumeSlider:v8];
    [(MPVolumeGroupSliderCoordinator *)self _updateOptimisticValueCache];
    [(MPVolumeGroupSliderCoordinator *)self _resetMasterVolumeSlider];
  }
}

- (void)addIndividualVolumeSlider:(id)a3
{
  id v8 = a3;
  if (!CFPreferencesGetAppBooleanValue(@"WHAOptimisticStateVolumeDisabled", @"com.apple.Music", 0))
  {
    id v4 = [(MPVolumeGroupSliderCoordinator *)self _findExistingVolumeSlider:v8];
    [(MPVolumeGroupSliderCoordinator *)self removeIndividualVolumeSlider:v4];

    [(NSMapTable *)self->_optimisticValues removeObjectForKey:v8];
    [(NSMapTable *)self->_optimisticScales removeObjectForKey:v8];
    [(NSMutableSet *)self->_individualVolumeSliders addObject:v8];
    [v8 value];
    objc_msgSend(v8, "setOptimisticValue:");
    uint64_t v5 = [(NSMutableSet *)self->_individualVolumeSliders setByAddingObject:self->_masterVolumeSlider];
    id v6 = [v5 allObjects];
    allSliders = self->_allSliders;
    self->_allSliders = v6;

    [(MPVolumeGroupSliderCoordinator *)self _addControlEventsForVolumeSlider:v8];
    [(MPVolumeGroupSliderCoordinator *)self _updateOptimisticValueCache];
    [(MPVolumeGroupSliderCoordinator *)self _resetMasterVolumeSlider];
  }
}

- (NSArray)individualVolumeSliders
{
  return (NSArray *)[(NSMutableSet *)self->_individualVolumeSliders allObjects];
}

- (MPVolumeGroupSliderCoordinator)initWithMasterVolumeSlider:(id)a3 individualVolumeSliders:(id)a4
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  v28.receiver = self;
  v28.super_class = (Class)MPVolumeGroupSliderCoordinator;
  uint64_t v9 = [(MPVolumeGroupSliderCoordinator *)&v28 init];
  uint64_t v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_masterVolumeSlider, a3);
    uint64_t v11 = [objc_alloc(MEMORY[0x1E4F1CA80]) initWithArray:v8];
    individualVolumeSliders = v10->_individualVolumeSliders;
    v10->_individualVolumeSliders = (NSMutableSet *)v11;

    uint64_t v13 = [MEMORY[0x1E4F28E10] strongToStrongObjectsMapTable];
    optimisticValues = v10->_optimisticValues;
    v10->_optimisticValues = (NSMapTable *)v13;

    uint64_t v15 = [MEMORY[0x1E4F28E10] strongToStrongObjectsMapTable];
    optimisticScales = v10->_optimisticScales;
    v10->_optimisticScales = (NSMapTable *)v15;

    v10->_inFlightDisableOptimisticStateRequests = 0;
    v10->_shouldOverrideTracking = 0;
    long long v24 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    id v17 = v8;
    uint64_t v18 = [v17 countByEnumeratingWithState:&v24 objects:v29 count:16];
    if (v18)
    {
      uint64_t v19 = v18;
      uint64_t v20 = *(void *)v25;
      do
      {
        for (uint64_t i = 0; i != v19; ++i)
        {
          if (*(void *)v25 != v20) {
            objc_enumerationMutation(v17);
          }
          uint64_t v22 = *(void *)(*((void *)&v24 + 1) + 8 * i);
          -[MPVolumeGroupSliderCoordinator addIndividualVolumeSlider:](v10, "addIndividualVolumeSlider:", v22, (void)v24);
          [(MPVolumeGroupSliderCoordinator *)v10 _addControlEventsForVolumeSlider:v22];
        }
        uint64_t v19 = [v17 countByEnumeratingWithState:&v24 objects:v29 count:16];
      }
      while (v19);
    }

    [(MPVolumeGroupSliderCoordinator *)v10 _addControlEventsForVolumeSlider:v10->_masterVolumeSlider];
    [(MPVolumeGroupSliderCoordinator *)v10 _updateOptimisticValueCache];
  }

  return v10;
}

@end