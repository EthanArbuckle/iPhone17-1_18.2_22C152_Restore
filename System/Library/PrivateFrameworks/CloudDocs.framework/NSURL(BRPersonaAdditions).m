@interface NSURL(BRPersonaAdditions)
- (BOOL)_br_isInPersonaRoot:()BRPersonaAdditions;
- (id)br_containerIDWithCurrentPersonaID:()BRPersonaAdditions needsPersonaSwitch:;
- (id)br_pathRelativeToSyncedRootURL:()BRPersonaAdditions currentPersonaID:;
- (uint64_t)_br_isInLocalHomeDirectoryUnderCurrentPersona;
- (uint64_t)_br_isInLocalHomeDirectoryUnderPersona:()BRPersonaAdditions needsPersonaSwitch:;
- (uint64_t)br_containerIDWithCurrentPersonaID:()BRPersonaAdditions;
- (uint64_t)br_mightBeOnDataSeparatedVolume;
@end

@implementation NSURL(BRPersonaAdditions)

- (BOOL)_br_isInPersonaRoot:()BRPersonaAdditions
{
  v4 = [a3 absoluteString];
  if (([v4 hasSuffix:@"/"] & 1) == 0)
  {
    uint64_t v5 = [v4 stringByAppendingString:@"/"];

    v4 = (void *)v5;
  }
  if ([a1 isFileReferenceURL])
  {
    v6 = [a1 filePathURL];
    v7 = [v6 absoluteString];
LABEL_7:

    goto LABEL_8;
  }
  v7 = [a1 absoluteString];
  if ([v7 hasPrefix:@"file:///var/"])
  {
    v6 = [v7 substringFromIndex:objc_msgSend(@"file:///var/", "length")];
    uint64_t v8 = [@"file:///private/var/" stringByAppendingString:v6];

    v7 = (void *)v8;
    goto LABEL_7;
  }
LABEL_8:
  BOOL v10 = v7
     && (unint64_t v9 = [v7 length], v9 >= objc_msgSend(v4, "length"))
     && objc_msgSend(v7, "compare:options:range:", v4, 1, 0, objc_msgSend(v4, "length")) == 0;

  return v10;
}

- (uint64_t)_br_isInLocalHomeDirectoryUnderPersona:()BRPersonaAdditions needsPersonaSwitch:
{
  id v6 = a3;
  v7 = +[BRDaemonConnection homeDirectoryURLForPersonaID:v6 needsPersonaSwitch:a4];
  uint64_t v8 = +[BRDaemonConnection mobileDocumentsURLForPersonaID:v6 needsPersonaSwitch:a4];

  if (objc_msgSend(a1, "_br_isInPersonaRoot:", v7)) {
    uint64_t v9 = 1;
  }
  else {
    uint64_t v9 = objc_msgSend(a1, "_br_isInPersonaRoot:", v8);
  }

  return v9;
}

- (uint64_t)_br_isInLocalHomeDirectoryUnderCurrentPersona
{
  v2 = objc_msgSend(NSString, "br_currentPersonaIDWithIsDataSeparated:", 0);
  uint64_t v3 = objc_msgSend(a1, "_br_isInLocalHomeDirectoryUnderPersona:needsPersonaSwitch:", v2, 0);

  return v3;
}

- (id)br_pathRelativeToSyncedRootURL:()BRPersonaAdditions currentPersonaID:
{
  id v6 = a3;
  id v7 = a4;
  int v8 = [a1 isFileURL];
  uint64_t v9 = 0;
  if (v6 && v8)
  {
    if (objc_msgSend(a1, "_br_isInLocalHomeDirectoryUnderPersona:needsPersonaSwitch:", v7, 0))
    {
      BOOL v10 = [v6 path];
      v11 = [a1 path];
      uint64_t v9 = objc_msgSend(v11, "br_pathRelativeToPath:", v10);
      if (![v9 length])
      {
        v12 = objc_msgSend(v11, "br_realpathKeepingLastSymlink");
        uint64_t v13 = objc_msgSend(v12, "br_pathRelativeToPath:", v10);

        uint64_t v9 = (void *)v13;
      }
    }
    else
    {
      uint64_t v9 = 0;
    }
  }

  return v9;
}

- (uint64_t)br_containerIDWithCurrentPersonaID:()BRPersonaAdditions
{
  return objc_msgSend(a1, "br_containerIDWithCurrentPersonaID:needsPersonaSwitch:", a3, 0);
}

- (id)br_containerIDWithCurrentPersonaID:()BRPersonaAdditions needsPersonaSwitch:
{
  id v6 = a3;
  if BRIsFPFSEnabled(v6, v7) && (objc_msgSend(a1, "br_isInTrash"))
  {
    int v8 = 0;
  }
  else
  {
    uint64_t v9 = +[BRDaemonConnection mobileDocumentsURLForPersonaID:v6 needsPersonaSwitch:a4];
    BOOL v10 = objc_msgSend(a1, "br_pathRelativeToSyncedRootURL:currentPersonaID:", v9, v6);

    v11 = [v10 pathComponents];
    if ([v11 count])
    {
      v12 = [BRMangledID alloc];
      uint64_t v13 = [v11 objectAtIndexedSubscript:0];
      v14 = [(BRMangledID *)v12 initWithMangledString:v13];

      int v8 = [(BRMangledID *)v14 appLibraryOrZoneName];
    }
    else
    {
      int v8 = 0;
    }
  }

  return v8;
}

- (uint64_t)br_mightBeOnDataSeparatedVolume
{
  v1 = [a1 pathComponents];
  if ((unint64_t)[v1 count] < 5)
  {
    int v3 = 1;
  }
  else
  {
    v2 = [v1 objectAtIndexedSubscript:0];
    int v3 = 1;
    if ([v2 isEqualToString:@"/"])
    {
      v4 = [v1 objectAtIndexedSubscript:1];
      if ([v4 isEqualToString:@"private"])
      {
        uint64_t v5 = [v1 objectAtIndexedSubscript:3];
        int v3 = [v5 isEqualToString:@"PersonaVolumes"] ^ 1;
      }
    }
  }
  return v3 ^ 1u;
}

@end