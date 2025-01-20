@interface ITunesStoreAPIInit
@end

@implementation ITunesStoreAPIInit

void ___ITunesStoreAPIInit_block_invoke()
{
  if (!kITunesDaemonDidDismissDialog)
  {
    v0 = (void **)MEMORY[0x192FBA870]("kITunesDaemonDidDismissDialog", @"iTunesStore");
    if (v0) {
      v1 = *v0;
    }
    else {
      v1 = 0;
    }
    objc_storeStrong((id *)&kITunesDaemonDidDismissDialog, v1);
  }
  if (!kITunesDaemonWillDisplayDialog)
  {
    v2 = (void **)MEMORY[0x192FBA870]("kITunesDaemonWillDisplayDialog", @"iTunesStore");
    if (v2) {
      v3 = *v2;
    }
    else {
      v3 = 0;
    }
    objc_storeStrong((id *)&kITunesDaemonWillDisplayDialog, v3);
  }
}

@end