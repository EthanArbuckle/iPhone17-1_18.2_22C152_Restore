@interface FTCinematicInput
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)sourceFrameTimestamp;
- (BOOL)detectorDidRun;
- (CGPoint)tapPosition;
- (FTCinematicInput)init;
- (FTCinematicTapRequest)tapRequest;
- (NSArray)observations;
- (int64_t)highPriorityTrackId;
- (vector<ft::Observation,)mapToInternalObservations;
- (void)setDetectorDidRun:(BOOL)a3;
- (void)setHighPriorityTrackId:(int64_t)a3;
- (void)setObservations:(id)a3;
- (void)setSourceFrameTimestamp:(id *)a3;
- (void)setTapPosition:(CGPoint)a3;
- (void)setTapRequest:(id)a3;
@end

@implementation FTCinematicInput

- (FTCinematicInput)init
{
  v6.receiver = self;
  v6.super_class = (Class)FTCinematicInput;
  v2 = [(FTCinematicInput *)&v6 init];
  v3 = v2;
  if (v2)
  {
    [(FTCinematicInput *)v2 setHighPriorityTrackId:-1];
    -[FTCinematicInput setTapPosition:](v3, "setTapPosition:", -1.0, -1.0);
    v4 = v3;
  }

  return v3;
}

- (vector<ft::Observation,)mapToInternalObservations
{
  uint64_t v66 = *MEMORY[0x263EF8340];
  retstr->var0 = 0;
  retstr->var1 = 0;
  retstr->var2.var0 = 0;
  v4 = [(FTCinematicInput *)self observations];
  unint64_t v5 = [v4 count];
  unint64_t v6 = v5;
  var0 = retstr->var0;
  if (0x86BCA1AF286BCA1BLL * ((retstr->var2.var0 - retstr->var0) >> 3) < v5)
  {
    if (v5 > 0x1AF286BCA1AF286) {
      std::vector<long long>::__throw_length_error[abi:ne180100]();
    }
    var1 = retstr->var1;
    v9 = (char *)operator new(152 * v5);
    v10 = (Observation *)&v9[152 * ((var1 - var0) / 152)];
    v11 = v10;
    if (var1 != var0)
    {
      v12 = &v9[152 * ((var1 - var0) / 152)];
      do
      {
        long long v13 = *(_OWORD *)((char *)var1 - 152);
        *(_OWORD *)(v12 - 136) = *(_OWORD *)((char *)var1 - 136);
        *(_OWORD *)(v12 - 152) = v13;
        long long v14 = *(_OWORD *)((char *)var1 - 120);
        long long v15 = *(_OWORD *)((char *)var1 - 104);
        long long v16 = *(_OWORD *)((char *)var1 - 88);
        *(_OWORD *)(v12 - 72) = *(_OWORD *)((char *)var1 - 72);
        *(_OWORD *)(v12 - 88) = v16;
        *(_OWORD *)(v12 - 104) = v15;
        *(_OWORD *)(v12 - 120) = v14;
        long long v17 = *(_OWORD *)((char *)var1 - 56);
        long long v18 = *(_OWORD *)((char *)var1 - 40);
        long long v19 = *(_OWORD *)((char *)var1 - 24);
        v11 = (Observation *)(v12 - 152);
        *((void *)v12 - 1) = *((void *)var1 - 1);
        *(_OWORD *)(v12 - 24) = v19;
        *(_OWORD *)(v12 - 40) = v18;
        *(_OWORD *)(v12 - 56) = v17;
        var1 = (Observation *)((char *)var1 - 152);
        v12 -= 152;
      }
      while (var1 != var0);
    }
    retstr->var0 = v11;
    retstr->var1 = v10;
    retstr->var2.var0 = (Observation *)&v9[152 * v6];
    if (var0) {
      operator delete(var0);
    }
  }

  long long v63 = 0u;
  long long v64 = 0u;
  long long v61 = 0u;
  long long v62 = 0u;
  v20 = [(FTCinematicInput *)self observations];
  uint64_t v21 = [v20 countByEnumeratingWithState:&v61 objects:v65 count:16];
  if (v21)
  {
    uint64_t v22 = 0;
    uint64_t v52 = *(void *)v62;
    do
    {
      for (uint64_t i = 0; i != v21; ++i)
      {
        if (*(void *)v62 != v52) {
          objc_enumerationMutation(v20);
        }
        v25 = *(void **)(*((void *)&v61 + 1) + 8 * i);
        [v25 box];
        *(void *)&long long v56 = v26;
        *((void *)&v56 + 1) = v27;
        *(void *)&long long v57 = v28;
        *((void *)&v57 + 1) = v29;
        *(void *)v58 = [v25 objectKind];
        [v25 confidence];
        *(_DWORD *)&v58[8] = v30;
        if (v25)
        {
          [v25 frameTimestamp];
          [v25 lastDetectionTimestamp];
        }
        else
        {
          memset(&v58[12], 0, 48);
        }
        char v31 = objc_opt_respondsToSelector();
        uint64_t v32 = -1;
        if (v31) {
          uint64_t v32 = [v25 identifier];
        }
        *(void *)&long long v59 = v32;
        BYTE8(v59) = 1;
        [(FTCinematicInput *)self sourceFrameTimestamp];
        *((void *)&v55 + 1) = v22;
        LOBYTE(v60) = 1;
        v34 = retstr->var1;
        v33 = retstr->var2.var0;
        if (v34 < v33)
        {
          *(_OWORD *)v34 = v56;
          *((_OWORD *)v34 + 1) = v57;
          *((_OWORD *)v34 + 4) = *(_OWORD *)&v58[32];
          *((_OWORD *)v34 + 5) = *(_OWORD *)&v58[48];
          *((_OWORD *)v34 + 2) = *(_OWORD *)v58;
          *((_OWORD *)v34 + 3) = *(_OWORD *)&v58[16];
          *((void *)v34 + 18) = v60;
          *((_OWORD *)v34 + 7) = v54;
          *((_OWORD *)v34 + 8) = v55;
          *((_OWORD *)v34 + 6) = v59;
          v24 = (Observation *)((char *)v34 + 152);
        }
        else
        {
          v35 = retstr->var0;
          unint64_t v36 = 0x86BCA1AF286BCA1BLL * ((v34 - retstr->var0) >> 3);
          unint64_t v37 = v36 + 1;
          if (v36 + 1 > 0x1AF286BCA1AF286) {
            std::vector<long long>::__throw_length_error[abi:ne180100]();
          }
          unint64_t v38 = 0x86BCA1AF286BCA1BLL * ((v33 - v35) >> 3);
          if (2 * v38 > v37) {
            unint64_t v37 = 2 * v38;
          }
          if (v38 >= 0xD79435E50D7943) {
            unint64_t v39 = 0x1AF286BCA1AF286;
          }
          else {
            unint64_t v39 = v37;
          }
          if (v39)
          {
            if (v39 > 0x1AF286BCA1AF286) {
              std::__throw_bad_array_new_length[abi:ne180100]();
            }
            v40 = (char *)operator new(152 * v39);
          }
          else
          {
            v40 = 0;
          }
          v41 = &v40[152 * v36];
          *((_OWORD *)v41 + 6) = v59;
          *((_OWORD *)v41 + 7) = v54;
          *((_OWORD *)v41 + 8) = v55;
          *((void *)v41 + 18) = v60;
          *((_OWORD *)v41 + 2) = *(_OWORD *)v58;
          *((_OWORD *)v41 + 3) = *(_OWORD *)&v58[16];
          *((_OWORD *)v41 + 4) = *(_OWORD *)&v58[32];
          *((_OWORD *)v41 + 5) = *(_OWORD *)&v58[48];
          *(_OWORD *)v41 = v56;
          *((_OWORD *)v41 + 1) = v57;
          v42 = (Observation *)v41;
          if (v34 != v35)
          {
            do
            {
              long long v43 = *(_OWORD *)((char *)v34 - 152);
              *(_OWORD *)((char *)v42 - 136) = *(_OWORD *)((char *)v34 - 136);
              *(_OWORD *)((char *)v42 - 152) = v43;
              long long v44 = *(_OWORD *)((char *)v34 - 120);
              long long v45 = *(_OWORD *)((char *)v34 - 104);
              long long v46 = *(_OWORD *)((char *)v34 - 88);
              *(_OWORD *)((char *)v42 - 72) = *(_OWORD *)((char *)v34 - 72);
              *(_OWORD *)((char *)v42 - 88) = v46;
              *(_OWORD *)((char *)v42 - 104) = v45;
              *(_OWORD *)((char *)v42 - 120) = v44;
              long long v47 = *(_OWORD *)((char *)v34 - 56);
              long long v48 = *(_OWORD *)((char *)v34 - 40);
              long long v49 = *(_OWORD *)((char *)v34 - 24);
              *((void *)v42 - 1) = *((void *)v34 - 1);
              *(_OWORD *)((char *)v42 - 24) = v49;
              *(_OWORD *)((char *)v42 - 40) = v48;
              *(_OWORD *)((char *)v42 - 56) = v47;
              v42 = (Observation *)((char *)v42 - 152);
              v34 = (Observation *)((char *)v34 - 152);
            }
            while (v34 != v35);
            v34 = v35;
          }
          v50 = (Observation *)&v40[152 * v39];
          v24 = (Observation *)(v41 + 152);
          retstr->var0 = v42;
          retstr->var1 = (Observation *)(v41 + 152);
          retstr->var2.var0 = v50;
          if (v34) {
            operator delete(v34);
          }
        }
        retstr->var1 = v24;
        ++v22;
      }
      uint64_t v21 = [v20 countByEnumeratingWithState:&v61 objects:v65 count:16];
    }
    while (v21);
  }

  return result;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)sourceFrameTimestamp
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = *($95D729B680665BEAEFA1D6FCA8238556 *)((char *)self + 56);
  return self;
}

- (void)setSourceFrameTimestamp:(id *)a3
{
  long long v3 = *(_OWORD *)&a3->var0;
  self->_sourceFrameTimestamp.epoch = a3->var3;
  *(_OWORD *)&self->_sourceFrameTimestamp.value = v3;
}

- (CGPoint)tapPosition
{
  double x = self->_tapPosition.x;
  double y = self->_tapPosition.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setTapPosition:(CGPoint)a3
{
  self->_tapPosition = a3;
}

- (FTCinematicTapRequest)tapRequest
{
  return self->_tapRequest;
}

- (void)setTapRequest:(id)a3
{
}

- (NSArray)observations
{
  return self->_observations;
}

- (void)setObservations:(id)a3
{
}

- (BOOL)detectorDidRun
{
  return self->_detectorDidRun;
}

- (void)setDetectorDidRun:(BOOL)a3
{
  self->_detectorDidRun = a3;
}

- (int64_t)highPriorityTrackId
{
  return self->_highPriorityTrackId;
}

- (void)setHighPriorityTrackId:(int64_t)a3
{
  self->_highPriorityTrackId = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observations, 0);

  objc_storeStrong((id *)&self->_tapRequest, 0);
}

@end