@interface VideoFrameWriterQueue
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)endTime;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)startTime;
- (AVAssetWriter)videoWriter;
- (AVAssetWriterInput)writerInput;
- (AVAssetWriterInputPixelBufferAdaptor)inputAdaptor;
- (BOOL)WaitForFinish;
- (BOOL)canceled;
- (BOOL)doneQueueing;
- (BOOL)writeSuccess;
- (NSConditionLock)drainConditionLock;
- (NSConditionLock)writingDoneLock;
- (NSError)writeError;
- (NSLock)frameArrayLock;
- (NSMutableArray)frameArray;
- (OS_dispatch_queue)frameWriteQueue;
- (VideoFrameWriterProgressRecipient)frameWriterUpdateCallback;
- (VideoFrameWriterQueue)initWithOutputURL:(id)a3 forMovieDimensions:(CGSize)a4 outputTransform:(CGAffineTransform *)a5 startTime:(id *)a6 endTime:(id *)a7;
- (id)FindFrameWithIndex:(int64_t)a3;
- (unint64_t)FramesInQueue;
- (unint64_t)drainTarget;
- (unint64_t)nextFrameIndex;
- (unsigned)drainMaximum;
- (unsigned)drainMinimum;
- (void)AddAFrame:(id)a3;
- (void)DrainIfAbove:(unsigned int)a3 downTo:(unsigned int)a4;
- (void)FrameRequestCallback;
- (void)StartWatchingForFrames;
- (void)dealloc;
- (void)setCanceled:(BOOL)a3;
- (void)setDoneQueueing:(BOOL)a3;
- (void)setDrainConditionLock:(id)a3;
- (void)setDrainMaximum:(unsigned int)a3;
- (void)setDrainMinimum:(unsigned int)a3;
- (void)setDrainTarget:(unint64_t)a3;
- (void)setEndTime:(id *)a3;
- (void)setFrameArray:(id)a3;
- (void)setFrameArrayLock:(id)a3;
- (void)setFrameWriteQueue:(id)a3;
- (void)setFrameWriterUpdateCallback:(id)a3;
- (void)setInputAdaptor:(id)a3;
- (void)setNextFrameIndex:(unint64_t)a3;
- (void)setStartTime:(id *)a3;
- (void)setVideoWriter:(id)a3;
- (void)setWriteError:(id)a3;
- (void)setWriteSuccess:(BOOL)a3;
- (void)setWriterInput:(id)a3;
- (void)setWritingDoneLock:(id)a3;
@end

@implementation VideoFrameWriterQueue

- (VideoFrameWriterQueue)initWithOutputURL:(id)a3 forMovieDimensions:(CGSize)a4 outputTransform:(CGAffineTransform *)a5 startTime:(id *)a6 endTime:(id *)a7
{
  double height = a4.height;
  double width = a4.width;
  v49.receiver = self;
  v49.super_class = (Class)VideoFrameWriterQueue;
  id v12 = a3;
  v13 = [(VideoFrameWriterQueue *)&v49 init];
  $3CC8671D27C23BF42ADDB32F2B5E48AE v48 = *a6;
  [v13 setStartTime:&v48];
  $3CC8671D27C23BF42ADDB32F2B5E48AE v47 = *a7;
  [v13 setEndTime:&v47];
  v14 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:32];
  [v13 setFrameArray:v14];

  *(void *)(v13 + 140) = 0x500000001;
  dispatch_queue_t v15 = dispatch_queue_create("frame write queue", 0);
  v16 = (void *)*((void *)v13 + 6);
  *((void *)v13 + 6) = v15;

  id v17 = objc_alloc_init(MEMORY[0x1E4F28E08]);
  v18 = (void *)*((void *)v13 + 5);
  *((void *)v13 + 5) = v17;

  uint64_t v19 = [objc_alloc(MEMORY[0x1E4F28BB8]) initWithCondition:1];
  v20 = (void *)*((void *)v13 + 13);
  *((void *)v13 + 13) = v19;

  uint64_t v21 = [objc_alloc(MEMORY[0x1E4F28BB8]) initWithCondition:1];
  v22 = (void *)*((void *)v13 + 19);
  *((void *)v13 + 19) = v21;

  id v23 = objc_alloc(MEMORY[0x1E4F163B8]);
  uint64_t v24 = *MEMORY[0x1E4F15AB0];
  id v46 = 0;
  v25 = (void *)[v23 initWithURL:v12 fileType:v24 error:&v46];

  id v26 = v46;
  [v13 setVideoWriter:v25];

  if (v26) {
    [v13 setWriteError:v26];
  }
  v27 = (void *)MEMORY[0x1E4F1C9E8];
  uint64_t v28 = *MEMORY[0x1E4F16230];
  uint64_t v29 = *MEMORY[0x1E4F16220];
  v30 = [NSNumber numberWithLong:(uint64_t)rint(width)];
  uint64_t v31 = *MEMORY[0x1E4F16300];
  v32 = [NSNumber numberWithLong:(uint64_t)rint(height)];
  v33 = objc_msgSend(v27, "dictionaryWithObjectsAndKeys:", v28, v29, v30, v31, v32, *MEMORY[0x1E4F162A0], 0);

  v34 = [MEMORY[0x1E4F163C0] assetWriterInputWithMediaType:*MEMORY[0x1E4F15C18] outputSettings:v33];
  [v13 setWriterInput:v34];

  long long v35 = *(_OWORD *)&a5->c;
  long long v43 = *(_OWORD *)&a5->a;
  long long v44 = v35;
  long long v45 = *(_OWORD *)&a5->tx;
  v36 = [v13 writerInput];
  v42[0] = v43;
  v42[1] = v44;
  v42[2] = v45;
  [v36 setTransform:v42];

  v37 = (void *)MEMORY[0x1E4F1C9E8];
  v38 = [NSNumber numberWithInt:1111970369];
  v39 = objc_msgSend(v37, "dictionaryWithObjectsAndKeys:", v38, *MEMORY[0x1E4F24D70], 0);

  v40 = [MEMORY[0x1E4F163D8] assetWriterInputPixelBufferAdaptorWithAssetWriterInput:*((void *)v13 + 2) sourcePixelBufferAttributes:v39];
  [v13 setInputAdaptor:v40];

  [*((id *)v13 + 1) addInput:*((void *)v13 + 2)];
  return (VideoFrameWriterQueue *)v13;
}

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)VideoFrameWriterQueue;
  [(VideoFrameWriterQueue *)&v2 dealloc];
}

- (void)AddAFrame:(id)a3
{
  frameArrayLock = self->frameArrayLock;
  id v5 = a3;
  [(NSLock *)frameArrayLock lock];
  [(NSMutableArray *)self->frameArray addObject:v5];

  [(NSLock *)self->frameArrayLock unlock];
  uint64_t drainMinimum = self->_drainMinimum;
  uint64_t drainMaximum = self->_drainMaximum;
  [(VideoFrameWriterQueue *)self DrainIfAbove:drainMaximum downTo:drainMinimum];
}

- (unint64_t)FramesInQueue
{
  [(NSLock *)self->frameArrayLock lock];
  unint64_t v3 = [(NSMutableArray *)self->frameArray count];
  [(NSLock *)self->frameArrayLock unlock];
  return v3;
}

- (BOOL)WaitForFinish
{
  if ([(NSConditionLock *)self->_writingDoneLock tryLockWhenCondition:3])
  {
    [(NSLock *)self->frameArrayLock lock];
    uint64_t v3 = [(NSMutableArray *)self->frameArray count];
    if (v3)
    {
      uint64_t v4 = v3 - 1;
      do
        [(NSMutableArray *)self->frameArray removeObjectAtIndex:v4--];
      while (v4 != -1);
    }
    [(NSLock *)self->frameArrayLock unlock];
  }
  else
  {
    [(NSConditionLock *)self->_writingDoneLock lock];
    [(NSConditionLock *)self->_writingDoneLock unlockWithCondition:2];
    [(NSConditionLock *)self->_writingDoneLock lockWhenCondition:3];
  }
  [(NSConditionLock *)self->_writingDoneLock unlockWithCondition:1];
  [(AVAssetWriterInput *)self->writerInput markAsFinished];
  videoWriter = self->videoWriter;
  long long v13 = *(_OWORD *)&self->endTime.value;
  int64_t epoch = self->endTime.epoch;
  [(AVAssetWriter *)videoWriter endSessionAtSourceTime:&v13];
  v6 = (void *)[objc_alloc(MEMORY[0x1E4F28BB8]) initWithCondition:0];
  v7 = self->videoWriter;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = sub_1DD4CE890;
  v11[3] = &unk_1E6CC8A00;
  id v12 = v6;
  id v8 = v6;
  [(AVAssetWriter *)v7 finishWritingWithCompletionHandler:v11];
  [v8 lockWhenCondition:1];
  [v8 unlock];
  BOOL writeSuccess = self->writeSuccess;

  return writeSuccess;
}

- (id)FindFrameWithIndex:(int64_t)a3
{
  [(NSLock *)self->frameArrayLock lock];
  uint64_t v5 = [(NSMutableArray *)self->frameArray count];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = 0;
    while (1)
    {
      id v8 = [(NSMutableArray *)self->frameArray objectAtIndex:v7];
      if ([v8 frameNumber] == a3) {
        break;
      }

      if (v6 == ++v7) {
        goto LABEL_5;
      }
    }
    [(NSMutableArray *)self->frameArray removeObjectAtIndex:v7];
  }
  else
  {
LABEL_5:
    id v8 = 0;
  }
  [(NSLock *)self->frameArrayLock unlock];
  return v8;
}

- (void)FrameRequestCallback
{
  uint64_t v3 = (void *)MEMORY[0x1E01B7BB0](self, a2);
  if ([(AVAssetWriterInput *)self->writerInput isReadyForMoreMediaData])
  {
    char v4 = 0;
    while (![(VideoFrameWriterQueue *)self canceled] && (v4 & 1) == 0)
    {
      uint64_t v5 = [(VideoFrameWriterQueue *)self FindFrameWithIndex:[(VideoFrameWriterQueue *)self nextFrameIndex]];
      if (v5)
      {
LABEL_6:
        inputAdaptor = self->inputAdaptor;
        uint64_t v7 = [v5 pixelBuffer];
        [v5 frameTime];
        LOBYTE(inputAdaptor) = [(AVAssetWriterInputPixelBufferAdaptor *)inputAdaptor appendPixelBuffer:v7 withPresentationTime:v14];
        id WeakRetained = objc_loadWeakRetained((id *)&self->frameWriterUpdateCallback);
        objc_msgSend(WeakRetained, "updateCallbackForFrameIndex:withPixelBuffer:", -[VideoFrameWriterQueue nextFrameIndex](self, "nextFrameIndex"), objc_msgSend(v5, "pixelBuffer"));

        [(VideoFrameWriterQueue *)self setNextFrameIndex:[(VideoFrameWriterQueue *)self nextFrameIndex] + 1];
        [v5 DeallocPixBuffer];

        if ((inputAdaptor & 1) == 0)
        {
          self->BOOL writeSuccess = 0;
          NSLog(&cfstr_FailedToAppend.isa);
          v11 = [(AVAssetWriter *)self->videoWriter error];
          id v12 = v11;
          if (v11)
          {
            NSLog(&cfstr_ErrorCodeD.isa, [v11 code]);
            id v13 = [v12 description];
            NSLog(&cfstr_ErrorDescripti.isa, [v13 UTF8String]);

            [(VideoFrameWriterQueue *)self setWriteError:v12];
          }
          [(NSConditionLock *)self->_writingDoneLock lock];
          [(NSConditionLock *)self->_writingDoneLock unlockWithCondition:3];

          break;
        }
        if ([(NSConditionLock *)self->_drainConditionLock tryLockWhenCondition:1])
        {
          if ([(VideoFrameWriterQueue *)self FramesInQueue] <= self->_drainTarget) {
            uint64_t v9 = 2;
          }
          else {
            uint64_t v9 = 1;
          }
          [(NSConditionLock *)self->_drainConditionLock unlockWithCondition:v9];
        }
      }
      else
      {
        while (![(VideoFrameWriterQueue *)self canceled])
        {
          if ([(NSConditionLock *)self->_writingDoneLock tryLockWhenCondition:2])
          {
            self->_doneQueueing = 1;
            [(NSConditionLock *)self->_writingDoneLock unlockWithCondition:2];
          }
          if (self->_doneQueueing && ![(VideoFrameWriterQueue *)self FramesInQueue])
          {
            [(NSConditionLock *)self->_writingDoneLock lock];
            [(NSConditionLock *)self->_writingDoneLock unlockWithCondition:3];
            char v4 = 1;
            goto LABEL_20;
          }
          [MEMORY[0x1E4F29060] sleepForTimeInterval:0.1];
          uint64_t v10 = [(VideoFrameWriterQueue *)self FindFrameWithIndex:[(VideoFrameWriterQueue *)self nextFrameIndex]];
          if (v10)
          {
            uint64_t v5 = (void *)v10;
            goto LABEL_6;
          }
        }
      }
      char v4 = 0;
LABEL_20:
      if (![(AVAssetWriterInput *)self->writerInput isReadyForMoreMediaData]) {
        break;
      }
    }
  }
  if (self->canceled && [(NSConditionLock *)self->_writingDoneLock tryLockWhenCondition:2])
  {
    self->_doneQueueing = 1;
    [(NSConditionLock *)self->_writingDoneLock unlockWithCondition:3];
  }
}

- (void)StartWatchingForFrames
{
  self->nextFrameIndex = 0;
  [(AVAssetWriter *)self->videoWriter startWriting];
  videoWriter = self->videoWriter;
  $95D729B680665BEAEFA1D6FCA8238556 startTime = self->startTime;
  [(AVAssetWriter *)videoWriter startSessionAtSourceTime:&startTime];
  self->BOOL writeSuccess = 1;
  writerInput = self->writerInput;
  frameWriteQueue = self->frameWriteQueue;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = sub_1DD4CECFC;
  v6[3] = &unk_1E6CC8A00;
  v6[4] = self;
  [(AVAssetWriterInput *)writerInput requestMediaDataWhenReadyOnQueue:frameWriteQueue usingBlock:v6];
}

- (void)DrainIfAbove:(unsigned int)a3 downTo:(unsigned int)a4
{
  if ([(VideoFrameWriterQueue *)self FramesInQueue] > a3)
  {
    [(NSConditionLock *)self->_drainConditionLock lock];
    self->_drainTarget = a4;
    [(NSConditionLock *)self->_drainConditionLock unlockWithCondition:1];
    id v6 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceNow:5.0];
    if (-[NSConditionLock lockWhenCondition:beforeDate:](self->_drainConditionLock, "lockWhenCondition:beforeDate:", 2))
    {
      [(NSConditionLock *)self->_drainConditionLock unlockWithCondition:0];
    }
  }
}

- (AVAssetWriterInputPixelBufferAdaptor)inputAdaptor
{
  return self->inputAdaptor;
}

- (void)setInputAdaptor:(id)a3
{
}

- (AVAssetWriter)videoWriter
{
  return self->videoWriter;
}

- (void)setVideoWriter:(id)a3
{
}

- (AVAssetWriterInput)writerInput
{
  return self->writerInput;
}

- (void)setWriterInput:(id)a3
{
}

- (NSMutableArray)frameArray
{
  return (NSMutableArray *)objc_getProperty(self, a2, 32, 1);
}

- (void)setFrameArray:(id)a3
{
}

- (NSLock)frameArrayLock
{
  return self->frameArrayLock;
}

- (void)setFrameArrayLock:(id)a3
{
}

- (OS_dispatch_queue)frameWriteQueue
{
  return self->frameWriteQueue;
}

- (void)setFrameWriteQueue:(id)a3
{
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)startTime
{
  objc_copyStruct(retstr, &self->startTime, 24, 1, 0);
  return result;
}

- (void)setStartTime:(id *)a3
{
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)endTime
{
  objc_copyStruct(retstr, &self->endTime, 24, 1, 0);
  return result;
}

- (void)setEndTime:(id *)a3
{
}

- (NSError)writeError
{
  return (NSError *)objc_getProperty(self, a2, 112, 1);
}

- (void)setWriteError:(id)a3
{
}

- (BOOL)writeSuccess
{
  return self->writeSuccess;
}

- (void)setWriteSuccess:(BOOL)a3
{
  self->BOOL writeSuccess = a3;
}

- (unint64_t)nextFrameIndex
{
  return self->nextFrameIndex;
}

- (void)setNextFrameIndex:(unint64_t)a3
{
  self->nextFrameIndex = a3;
}

- (BOOL)canceled
{
  return self->canceled;
}

- (void)setCanceled:(BOOL)a3
{
  self->canceled = a3;
}

- (VideoFrameWriterProgressRecipient)frameWriterUpdateCallback
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->frameWriterUpdateCallback);
  return (VideoFrameWriterProgressRecipient *)WeakRetained;
}

- (void)setFrameWriterUpdateCallback:(id)a3
{
}

- (BOOL)doneQueueing
{
  return self->_doneQueueing;
}

- (void)setDoneQueueing:(BOOL)a3
{
  self->_doneQueueing = a3;
}

- (NSConditionLock)drainConditionLock
{
  return (NSConditionLock *)objc_getProperty(self, a2, 152, 1);
}

- (void)setDrainConditionLock:(id)a3
{
}

- (unsigned)drainMaximum
{
  return self->_drainMaximum;
}

- (void)setDrainMaximum:(unsigned int)a3
{
  self->_uint64_t drainMaximum = a3;
}

- (unsigned)drainMinimum
{
  return self->_drainMinimum;
}

- (void)setDrainMinimum:(unsigned int)a3
{
  self->_uint64_t drainMinimum = a3;
}

- (unint64_t)drainTarget
{
  return self->_drainTarget;
}

- (void)setDrainTarget:(unint64_t)a3
{
  self->_drainTarget = a3;
}

- (NSConditionLock)writingDoneLock
{
  return (NSConditionLock *)objc_getProperty(self, a2, 104, 1);
}

- (void)setWritingDoneLock:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->frameWriterUpdateCallback);
  objc_storeStrong((id *)&self->_drainConditionLock, 0);
  objc_storeStrong((id *)&self->writeError, 0);
  objc_storeStrong((id *)&self->_writingDoneLock, 0);
  objc_storeStrong((id *)&self->frameWriteQueue, 0);
  objc_storeStrong((id *)&self->frameArrayLock, 0);
  objc_storeStrong((id *)&self->frameArray, 0);
  objc_storeStrong((id *)&self->inputAdaptor, 0);
  objc_storeStrong((id *)&self->writerInput, 0);
  objc_storeStrong((id *)&self->videoWriter, 0);
}

@end