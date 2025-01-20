@interface PDFActionRemoteGoToPrivateVars
@end

@implementation PDFActionRemoteGoToPrivateVars

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->destination, 0);

  objc_storeStrong((id *)&self->url, 0);
}

@end