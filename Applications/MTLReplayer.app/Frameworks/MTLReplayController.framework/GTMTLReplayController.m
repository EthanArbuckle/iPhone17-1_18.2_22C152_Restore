@interface GTMTLReplayController
@end

@implementation GTMTLReplayController

id __GTMTLReplayController_defaultDispatchFunction_noPinning_block_invoke_4(uint64_t a1)
{
  return [*(id *)(a1 + 32) length];
}

id __GTMTLReplayController_generateWireframeTexture_block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) device];
}

void __GTMTLReplayController_init_block_invoke(id a1, unint64_t a2, const char *a3, unsigned int a4, NSString *a5)
{
  if (((unint64_t)qword_773120 >> a2))
  {
    uint64_t v5 = *(void *)&a4;
    v12[0] = @"GTErrorKeyFile";
    v7 = a5;
    v8 = +[NSString stringWithUTF8String:a3];
    v13[0] = v8;
    v12[1] = @"GTErrorKeyLine";
    v9 = +[NSNumber numberWithUnsignedInt:v5];
    v13[1] = v9;
    v13[2] = @"The replayer encountered a Metal validation layer error.";
    v12[2] = NSLocalizedDescriptionKey;
    v12[3] = NSLocalizedFailureReasonErrorKey;
    v13[3] = v7;
    v10 = +[NSDictionary dictionaryWithObjects:v13 forKeys:v12 count:4];

    MakeNSError(200, v10);
    id v11 = (id)objc_claimAutoreleasedReturnValue();

    GTMTLReplay_handleNSError(v11);
  }
}

@end