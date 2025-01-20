@interface CinematicTracker
- (CinematicFramingSessionOptions)options;
- (CinematicTracker)init;
- (NSArray)tracks;
- (void)processDetections:(id)a3 ofType:(int64_t)a4 atTime:(id *)a5;
- (void)processFaceDetections:(id)a3 bodyDetections:(id)a4 atTime:(id *)a5 inView:(CGRect)a6;
- (void)removeTrackOfType:(int64_t)a3 atIndex:(int)a4 atTime:(id *)a5;
- (void)resetTracksFramingProperties;
- (void)setOptions:(id)a3;
- (void)updateBodyFacePairsAtTime:(id *)a3;
@end

@implementation CinematicTracker

- (CinematicTracker)init
{
  v17.receiver = self;
  v17.super_class = (Class)CinematicTracker;
  v2 = [(CinematicTracker *)&v17 init];
  v3 = v2;
  if (v2)
  {
    uint64_t v4 = 0;
    allTracks = v2->_allTracks;
    tracksOidMappings = v2->_tracksOidMappings;
    char v7 = 1;
    do
    {
      char v8 = v7;
      v9 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
      v10 = allTracks[v4];
      allTracks[v4] = v9;

      v11 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
      v12 = tracksOidMappings[v4];
      tracksOidMappings[v4] = v11;

      char v7 = 0;
      uint64_t v4 = 1;
    }
    while ((v8 & 1) != 0);
    v13 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    oidToTrackMap = v3->_oidToTrackMap;
    v3->_oidToTrackMap = v13;

    v3->_trackIndexCounter = 0;
    v15 = v3;
  }

  return v3;
}

- (void)removeTrackOfType:(int64_t)a3 atIndex:(int)a4 atTime:(id *)a5
{
  allTracks = self->_allTracks;
  uint64_t v8 = a4;
  id v14 = [(NSMutableArray *)self->_allTracks[a3] objectAtIndexedSubscript:a4];
  v9 = [v14 pairTrack];

  if (v9)
  {
    v10 = [v14 pairTrack];
    [v10 setPairTrack:0];

    [v14 setPairTrack:0];
  }
  oidToTrackMap = self->_oidToTrackMap;
  v12 = (id *)(&self->super.isa + a3);
  v13 = [v12[3] objectAtIndexedSubscript:v8];
  [(NSMutableDictionary *)oidToTrackMap removeObjectForKey:v13];

  [(NSMutableArray *)allTracks[a3] exchangeObjectAtIndex:v8 withObjectAtIndex:[(NSMutableArray *)allTracks[a3] count] - 1];
  [(NSMutableArray *)allTracks[a3] removeLastObject];
  objc_msgSend(v12[3], "exchangeObjectAtIndex:withObjectAtIndex:", v8, objc_msgSend(v12[3], "count") - 1);
  [v12[3] removeLastObject];
}

- (void)processFaceDetections:(id)a3 bodyDetections:(id)a4 atTime:(id *)a5 inView:(CGRect)a6
{
  double height = a6.size.height;
  double width = a6.size.width;
  double y = a6.origin.y;
  double x = a6.origin.x;
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v13 = a3;
  CMTime lhs = *(CMTime *)a5;
  [(CinematicTracker *)self processDetections:a4 ofType:0 atTime:&lhs];
  CMTime lhs = *(CMTime *)a5;
  char v14 = 1;
  [(CinematicTracker *)self processDetections:v13 ofType:1 atTime:&lhs];
  uint64_t v15 = 0;
  allTracks = self->_allTracks;
  do
  {
    char v17 = v14;
    if ([(NSMutableArray *)allTracks[v15] count])
    {
      uint64_t v18 = 0;
      uint64_t v19 = 0;
      do
      {
        v20 = [(NSMutableArray *)allTracks[v15] objectAtIndexedSubscript:v18];
        v21 = v20;
        if (v20) {
          [v20 lastTimestamp];
        }
        else {
          memset(&rhs, 0, sizeof(rhs));
        }
        CMTime lhs = (CMTime)*a5;
        CMTimeSubtract(&time, &lhs, &rhs);
        if (CMTimeGetSeconds(&time) > 1.0)
        {
          CMTime lhs = (CMTime)*a5;
          [(CinematicTracker *)self removeTrackOfType:v15 atIndex:v19 atTime:&lhs];
          LODWORD(v19) = v19 - 1;
        }

        uint64_t v19 = (v19 + 1);
        uint64_t v18 = (int)v19;
      }
      while ([(NSMutableArray *)allTracks[v15] count] > (unint64_t)(int)v19);
    }
    char v14 = 0;
    uint64_t v15 = 1;
  }
  while ((v17 & 1) != 0);
  CMTime lhs = (CMTime)*a5;
  [(CinematicTracker *)self updateBodyFacePairsAtTime:&lhs];
  if ([(NSMutableArray *)self->_allTracks[0] count])
  {
    uint64_t v22 = 0;
    uint64_t v23 = 0;
    do
    {
      v24 = [(NSMutableArray *)*allTracks objectAtIndexedSubscript:v22];
      if ([v24 identifier] < 0)
      {
        v25 = [v24 pairTrack];

        if (!v25)
        {
          CMTime lhs = (CMTime)*a5;
          [(CinematicTracker *)self removeTrackOfType:0 atIndex:v23 atTime:&lhs];
          LODWORD(v23) = v23 - 1;
        }
      }

      uint64_t v23 = (v23 + 1);
      uint64_t v22 = (int)v23;
    }
    while ([(NSMutableArray *)*allTracks count] > (unint64_t)(int)v23);
  }
  v26 = [(CinematicTracker *)self tracks];
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  uint64_t v27 = [v26 countByEnumeratingWithState:&v32 objects:v39 count:16];
  if (v27)
  {
    uint64_t v28 = v27;
    uint64_t v29 = *(void *)v33;
    do
    {
      for (uint64_t i = 0; i != v28; ++i)
      {
        if (*(void *)v33 != v29) {
          objc_enumerationMutation(v26);
        }
        v31 = *(void **)(*((void *)&v32 + 1) + 8 * i);
        CMTime lhs = (CMTime)*a5;
        objc_msgSend(v31, "updatePropertiesWithTimestamp:inView:", &lhs, x, y, width, height);
      }
      uint64_t v28 = [v26 countByEnumeratingWithState:&v32 objects:v39 count:16];
    }
    while (v28);
  }
}

- (void)resetTracksFramingProperties
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  v2 = [(CinematicTracker *)self tracks];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  uint64_t v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v8;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v8 != v5) {
          objc_enumerationMutation(v2);
        }
        [*(id *)(*((void *)&v7 + 1) + 8 * v6++) resetProperties];
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v4);
  }
}

- (NSArray)tracks
{
  return (NSArray *)self->_allTracks[0];
}

- (void)processDetections:(id)a3 ofType:(int64_t)a4 atTime:(id *)a5
{
  uint64_t v97 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  long long v91 = 0u;
  long long v92 = 0u;
  long long v93 = 0u;
  long long v94 = 0u;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v91 objects:v96 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v92;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v92 != v11) {
          objc_enumerationMutation(v8);
        }
        id v13 = *(void **)(*((void *)&v91 + 1) + 8 * i);
        oidToTrackMap = self->_oidToTrackMap;
        uint64_t v15 = objc_msgSend(NSNumber, "numberWithLong:", objc_msgSend(v13, "oid"));
        v16 = [(NSMutableDictionary *)oidToTrackMap objectForKeyedSubscript:v15];

        if (v16)
        {
          CMTime time2 = (CMTime)*a5;
          [v16 addObservation:v13 atTime:&time2];
        }
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v91 objects:v96 count:16];
    }
    while (v10);
  }
  long long v88 = 0u;
  long long v89 = 0u;
  long long v86 = 0u;
  long long v87 = 0u;
  id obj = v8;
  uint64_t v17 = [obj countByEnumeratingWithState:&v86 objects:v95 count:16];
  if (v17)
  {
    uint64_t v18 = v17;
    uint64_t v19 = *(void *)v87;
    allTracks = self->_allTracks;
    tracksOidMappings = self->_tracksOidMappings;
    v80 = self;
    uint64_t v76 = *(void *)v87;
    do
    {
      uint64_t v21 = 0;
      uint64_t v77 = v18;
      do
      {
        if (*(void *)v87 != v19) {
          objc_enumerationMutation(obj);
        }
        uint64_t v22 = *(void **)(*((void *)&v86 + 1) + 8 * v21);
        uint64_t v23 = self->_oidToTrackMap;
        v24 = objc_msgSend(NSNumber, "numberWithLong:", objc_msgSend(v22, "oid"));
        v25 = [(NSMutableDictionary *)v23 objectForKeyedSubscript:v24];

        if (!v25)
        {
          uint64_t v26 = [v22 oid];
          if (![(NSMutableArray *)allTracks[a4] count]) {
            goto LABEL_28;
          }
          unint64_t v27 = 0;
          int v28 = -1;
          double v84 = INFINITY;
          do
          {
            uint64_t v29 = [(NSMutableArray *)allTracks[a4] objectAtIndexedSubscript:v27];
            v30 = v29;
            if (v29) {
              [v29 lastTimestamp];
            }
            else {
              memset(&time1, 0, sizeof(time1));
            }
            CMTime time2 = (CMTime)*a5;
            if (CMTimeCompare(&time1, &time2))
            {
              [v30 lastObservationBounds];
              CGFloat v32 = v31;
              CGFloat v34 = v33;
              CGFloat v36 = v35;
              CGFloat v81 = v35;
              CGFloat v38 = v37;
              [v22 bounds];
              CGFloat v40 = v39;
              CGFloat v42 = v41;
              CGFloat v44 = v43;
              CGFloat v46 = v45;
              v98.origin.double x = v32;
              v98.origin.double y = v34;
              v98.size.double width = v36;
              v98.size.double height = v38;
              double MidX = CGRectGetMidX(v98);
              v99.origin.double x = v40;
              v99.origin.double y = v42;
              v99.size.double width = v44;
              v99.size.double height = v46;
              float v48 = MidX - CGRectGetMidX(v99);
              float v83 = v48;
              v100.origin.double x = v32;
              CGFloat v49 = v32;
              v100.origin.double y = v34;
              v100.size.double width = v81;
              v100.size.double height = v38;
              double MidY = CGRectGetMidY(v100);
              v101.origin.double x = v40;
              v101.origin.double y = v42;
              v101.size.double width = v44;
              v101.size.double height = v46;
              float v51 = MidY - CGRectGetMidY(v101);
              float v82 = v51;
              v102.origin.double x = v49;
              v102.origin.double y = v34;
              v102.size.double width = v81;
              v102.size.double height = v38;
              double Width = CGRectGetWidth(v102);
              v103.origin.double x = v40;
              v103.origin.double y = v42;
              v103.size.double width = v44;
              v103.size.double height = v46;
              CGFloat v53 = CGRectGetWidth(v103);
              double v54 = v84;
              *(float *)&CGFloat v53 = Width - v53;
              double v55 = (float)((float)((float)(v82 * v82) + (float)(v83 * v83)) + (float)(*(float *)&v53 * *(float *)&v53));
              if (v84 > v55)
              {
                int v28 = v27;
                double v54 = v55;
              }
              double v84 = v54;
            }

            ++v27;
          }
          while ([(NSMutableArray *)allTracks[a4] count] > v27);
          self = v80;
          if (v28 == -1)
          {
LABEL_28:
            ++self->_trackIndexCounter;
            if (a4)
            {
              v66 = [BaseTrack alloc];
              unint64_t trackIndexCounter = self->_trackIndexCounter;
              CMTime time2 = (CMTime)*a5;
              uint64_t v68 = [(BaseTrack *)v66 initWithObservation:v22 identifier:trackIndexCounter type:a4 atTime:&time2];
            }
            else
            {
              v69 = [CinematicTrack alloc];
              unint64_t v70 = self->_trackIndexCounter;
              options = self->_options;
              CMTime time2 = (CMTime)*a5;
              uint64_t v68 = [(CinematicTrack *)v69 initWithObservation:v22 identifier:v70 options:options atTime:&time2];
            }
            v65 = (void *)v68;
            v72 = self->_oidToTrackMap;
            v73 = [NSNumber numberWithLong:v26];
            [(NSMutableDictionary *)v72 setObject:v65 forKeyedSubscript:v73];

            [(NSMutableArray *)allTracks[a4] addObject:v65];
            v74 = tracksOidMappings[a4];
            v75 = [NSNumber numberWithLong:v26];
            [(NSMutableArray *)v74 addObject:v75];
          }
          else
          {
            v56 = v80->_oidToTrackMap;
            uint64_t v57 = v28;
            v58 = [(NSMutableArray *)tracksOidMappings[a4] objectAtIndexedSubscript:v28];
            [(NSMutableDictionary *)v56 removeObjectForKey:v58];

            [(NSMutableArray *)allTracks[a4] objectAtIndexedSubscript:v57];
            v60 = uint64_t v59 = v26;
            v61 = v80->_oidToTrackMap;
            v62 = [NSNumber numberWithLong:v59];
            v63 = v61;
            self = v80;
            [(NSMutableDictionary *)v63 setObject:v60 forKeyedSubscript:v62];

            v64 = [NSNumber numberWithLong:v59];
            [(NSMutableArray *)tracksOidMappings[a4] setObject:v64 atIndexedSubscript:v57];

            v65 = [(NSMutableArray *)allTracks[a4] objectAtIndexedSubscript:v57];
            CMTime time2 = (CMTime)*a5;
            [v65 addObservation:v22 atTime:&time2];
          }

          uint64_t v19 = v76;
          uint64_t v18 = v77;
          v25 = 0;
        }

        ++v21;
      }
      while (v21 != v18);
      uint64_t v18 = [obj countByEnumeratingWithState:&v86 objects:v95 count:16];
    }
    while (v18);
  }
}

- (void)updateBodyFacePairsAtTime:(id *)a3
{
  uint64_t v108 = *MEMORY[0x1E4F143B8];
  long long v101 = 0u;
  long long v102 = 0u;
  long long v103 = 0u;
  long long v104 = 0u;
  uint64_t v3 = self->_allTracks[0];
  uint64_t v4 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v101 objects:v107 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v102;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v102 != v6) {
          objc_enumerationMutation(v3);
        }
        id v8 = *(void **)(*((void *)&v101 + 1) + 8 * i);
        uint64_t v9 = [v8 pairTrack];
        if (v9)
        {
          uint64_t v10 = (void *)v9;
          uint64_t v11 = [v8 identifier];

          if ((v11 & 0x8000000000000000) == 0)
          {
            [v8 lastObservationBounds];
            CGFloat v13 = v12;
            CGFloat v15 = v14;
            CGFloat v17 = v16;
            CGFloat v19 = v18;
            v20 = [v8 pairTrack];
            [v20 lastObservationBounds];
            v117.origin.double x = v21;
            v117.origin.double y = v22;
            v117.size.double width = v23;
            v117.size.double height = v24;
            v109.origin.double x = v13;
            v109.origin.double y = v15;
            v109.size.double width = v17;
            v109.size.double height = v19;
            CGRect v110 = CGRectIntersection(v109, v117);
            *(float *)&CGFloat v13 = v110.size.width * v110.size.height;
            v25 = [v8 pairTrack];
            [v25 lastObservationBounds];
            float v28 = v26 * v27;
            *(float *)&CGFloat v15 = v28 * 0.3;

            if (*(float *)&v15 > *(float *)&v13)
            {
              uint64_t v29 = [v8 pairTrack];
              [v29 setPairTrack:0];

              [v8 setPairTrack:0];
            }
          }
        }
      }
      uint64_t v5 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v101 objects:v107 count:16];
    }
    while (v5);
  }

  long long v99 = 0u;
  long long v100 = 0u;
  long long v97 = 0u;
  long long v98 = 0u;
  id obj = self->_allTracks[1];
  uint64_t v30 = [(NSMutableArray *)obj countByEnumeratingWithState:&v97 objects:v106 count:16];
  if (v30)
  {
    uint64_t v31 = v30;
    uint64_t v32 = *(void *)v98;
    do
    {
      for (uint64_t j = 0; j != v31; ++j)
      {
        if (*(void *)v98 != v32) {
          objc_enumerationMutation(obj);
        }
        CGFloat v34 = *(void **)(*((void *)&v97 + 1) + 8 * j);
        uint64_t v35 = objc_msgSend(v34, "pairTrack", v87);
        if (v35)
        {
          CGFloat v36 = (void *)v35;
          double v37 = [v34 pairTrack];
          uint64_t v38 = [v37 identifier];

          if (v38 > 0) {
            continue;
          }
        }
        long long v95 = 0u;
        long long v96 = 0u;
        long long v93 = 0u;
        long long v94 = 0u;
        double v39 = self->_allTracks[0];
        uint64_t v40 = [(NSMutableArray *)v39 countByEnumeratingWithState:&v93 objects:v105 count:16];
        if (v40)
        {
          uint64_t v41 = v40;
          CGFloat v42 = 0;
          uint64_t v43 = *(void *)v94;
          float v44 = 0.0;
          while (1)
          {
            uint64_t v45 = 0;
            do
            {
              if (*(void *)v94 != v43) {
                objc_enumerationMutation(v39);
              }
              CGFloat v46 = *(void **)(*((void *)&v93 + 1) + 8 * v45);
              v47 = [v46 pairTrack];
              if (v47) {
                goto LABEL_25;
              }
              if ([v46 identifier] >= 1)
              {
                [v34 lastObservationBounds];
                CGFloat v49 = v48;
                CGFloat v51 = v50;
                CGFloat v53 = v52;
                CGFloat v55 = v54;
                [v46 lastObservationBounds];
                v118.origin.double x = v56;
                v118.origin.double y = v57;
                v118.size.double width = v58;
                v118.size.double height = v59;
                v111.origin.double x = v49;
                v111.origin.double y = v51;
                v111.size.double width = v53;
                v111.size.double height = v55;
                CGRect v112 = CGRectIntersection(v111, v118);
                float v60 = v112.size.width * v112.size.height;
                if (v44 < v60)
                {
                  id v61 = v46;
                  v47 = v42;
                  CGFloat v42 = v61;
                  float v44 = v60;
LABEL_25:
                }
              }
              ++v45;
            }
            while (v41 != v45);
            uint64_t v62 = [(NSMutableArray *)v39 countByEnumeratingWithState:&v93 objects:v105 count:16];
            uint64_t v41 = v62;
            if (!v62) {
              goto LABEL_34;
            }
          }
        }
        CGFloat v42 = 0;
        float v44 = 0.0;
LABEL_34:

        [v34 lastObservationBounds];
        float v65 = v63 * v64;
        if ((float)(v44 / v65) <= 0.3 || v42 == 0)
        {
          options = self->_options;
          if (options
            && [(CinematicFramingSessionOptions *)options inferSubjectBodyFromFaceLocation])
          {
            [v34 lastObservationBounds];
            CGFloat Width = CGRectGetWidth(v113);
            float v69 = Width + Width;
            [v34 lastObservationBounds];
            float v70 = CGRectGetHeight(v114) * 3.0;
            [v34 lastObservationBounds];
            double v71 = v69;
            CGFloat v72 = CGRectGetMidX(v115) + v71 * -0.5;
            [v34 lastObservationBounds];
            double v73 = v70;
            CGFloat v74 = CGRectGetMinY(v116) + v73 / -10.0;
            v75 = objc_alloc_init(Detection);
            -[Detection setOid:](v75, "setOid:", -[v34 identifier]);
            -[Detection setBounds:](v75, "setBounds:", v72, v74, v71, v73);
            uint64_t v76 = [v34 pairTrack];

            if (v76)
            {
              uint64_t v77 = [v34 pairTrack];
              long long v91 = *(_OWORD *)&a3->var0;
              int64_t var3 = a3->var3;
              [(BaseTrack *)v77 addObservation:v75 atTime:&v91];
            }
            else
            {
              uint64_t v87 = [(Detection *)v75 oid];
              ++self->_trackIndexCounter;
              v80 = [CinematicTrack alloc];
              CGFloat v81 = self->_options;
              unint64_t v82 = -self->_trackIndexCounter;
              long long v91 = *(_OWORD *)&a3->var0;
              int64_t var3 = a3->var3;
              uint64_t v77 = [(CinematicTrack *)v80 initWithObservation:v75 identifier:v82 options:v81 atTime:&v91];
              oidToTrackMap = self->_oidToTrackMap;
              double v84 = [NSNumber numberWithLong:v87];
              [(NSMutableDictionary *)oidToTrackMap setObject:v77 forKeyedSubscript:v84];

              [(NSMutableArray *)self->_allTracks[0] addObject:v77];
              v85 = self->_tracksOidMappings[0];
              long long v86 = [NSNumber numberWithLong:v87];
              [(NSMutableArray *)v85 addObject:v86];

              [(BaseTrack *)v77 setPairTrack:v34];
              [v34 setPairTrack:v77];
            }
          }
        }
        else
        {
          v78 = [v34 pairTrack];

          if (v78)
          {
            v79 = [v34 pairTrack];
            [v79 setPairTrack:0];
          }
          [v34 setPairTrack:v42];
          [v42 setPairTrack:v34];
        }
      }
      uint64_t v31 = [(NSMutableArray *)obj countByEnumeratingWithState:&v97 objects:v106 count:16];
    }
    while (v31);
  }
}

- (CinematicFramingSessionOptions)options
{
  return self->_options;
}

- (void)setOptions:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_options, 0);
  objc_storeStrong((id *)&self->_oidToTrackMap, 0);
  for (uint64_t i = 32; i != 16; i -= 8)
    objc_storeStrong((id *)((char *)&self->super.isa + i), 0);
  do
  {
    objc_storeStrong((id *)((char *)&self->super.isa + i), 0);
    i -= 8;
  }
  while (i);
}

@end