@interface NSError(SYError)
+ (id)errorWithSYError:()SYError userInfo:;
- (uint64_t)initWithSYError:()SYError userInfo:;
@end

@implementation NSError(SYError)

+ (id)errorWithSYError:()SYError userInfo:
{
  id v6 = a4;
  v7 = (void *)[[a1 alloc] initWithSYError:a3 userInfo:v6];

  return v7;
}

- (uint64_t)initWithSYError:()SYError userInfo:
{
  id v6 = (void *)[a4 mutableCopy];
  v7 = v6;
  if (v6) {
    id v8 = v6;
  }
  else {
    id v8 = (id)[objc_alloc(MEMORY[0x263EFF9A0]) initWithCapacity:1];
  }
  v9 = v8;

  uint64_t v10 = *MEMORY[0x263F08320];
  v11 = [v9 objectForKeyedSubscript:*MEMORY[0x263F08320]];

  if (!v11)
  {
    switch(a3)
    {
      case 2001:
        v12 = @"The receiver has not completed its setup.";
        goto LABEL_41;
      case 2002:
        v12 = @"The receiver is already running.";
        goto LABEL_41;
      case 2003:
        v12 = @"This operation cannot complete until pairing is completed.";
        goto LABEL_41;
      case 2004:
        v12 = @"This message is part of a session, but that session doesn't appear to exist.";
        goto LABEL_41;
      case 2005:
        v12 = @"The receiver already has a session in progress, and does not believe it should cancel that one to take this message.";
        goto LABEL_41;
      case 2006:
        v12 = @"The received message's session ID does not match the ID of the currently active session";
        goto LABEL_41;
      case 2007:
        v12 = @"The transaction timed out.";
        goto LABEL_41;
      case 2008:
        v12 = @"This feature is not supported by this client.";
        goto LABEL_41;
      case 2009:
        v12 = @"The SYSession is not currently running. Either it has not been started or it has completed.";
        goto LABEL_41;
      case 2010:
        v12 = @"The SYSession is currently starting or restarting, and cannot perform the requested operation.";
        goto LABEL_41;
      case 2011:
        v12 = @"The SYSession is not in the correct state to handle this message.";
        goto LABEL_41;
      case 2012:
        v12 = @"One or more sync batches failed to be delivered or acknowledged.";
        goto LABEL_41;
      case 2013:
        v12 = @"There is no data available for the given session.";
        goto LABEL_41;
      case 2014:
        v12 = @"A reset sync was sent to a master device from a slave. This is not supported.";
        goto LABEL_41;
      case 2015:
        v12 = @"The received message was not recognized.";
        goto LABEL_41;
      case 2016:
        v12 = @"The received message could not be deserialized, and may have become corrupted.";
        goto LABEL_41;
      case 2017:
        v12 = @"The system could not generate a sync message; some data was unavailable.";
        goto LABEL_41;
      case 2018:
        [v9 setObject:@"The system tried to switch protocols on the fly, but failed.", v10 forKeyedSubscript];
        uint64_t v13 = *MEMORY[0x263F08348];
        v12 = @"Retry the operation immediately -- the SYService should be able to start a new session correctly. It's the internal swap-stuff-around that's failed.";
        v14 = v9;
        goto LABEL_42;
      case 2019:
        v12 = @"The message was dropped due to a device switch.";
        goto LABEL_41;
      case 2020:
        v12 = @"A delegate object needs to implement an optional method to perform the requested action.";
        goto LABEL_41;
      case 2021:
        v12 = @"The session was terminated due to a device switch.";
        goto LABEL_41;
      case 2022:
        v12 = @"The session was canceled to make way for a requested reset sync.";
        goto LABEL_41;
      case 2023:
        v12 = @"The session was canceled due to losing in a collision; the winning session will begin momentarily.";
        goto LABEL_41;
      case 2024:
        v12 = @"A reset request was sent to a slave device, which is invalid.";
        goto LABEL_41;
      default:
        switch(a3)
        {
          case 1001:
            v12 = @"Waiting for Full Sync";
            break;
          case 1002:
            v12 = @"Session ID mismatch";
            break;
          case 1003:
            v12 = @"Snsseih packet lost";
            break;
          case 1004:
            v12 = @"Sender died";
            break;
          case 1005:
            v12 = @"Initial full sync must happen first";
            break;
          case 1006:
            v12 = @"Deletions are not permitted for this client.";
            break;
          case 1007:
            v12 = @"There is a full-sync pending; please terminate this delta sync.";
            break;
          case 1008:
            v12 = @"No peer device is connected or available at this time.";
            break;
          default:
            if (a3 != -128) {
              goto LABEL_43;
            }
            v12 = @"Operation was canceled";
            break;
        }
LABEL_41:
        v14 = v9;
        uint64_t v13 = v10;
LABEL_42:
        [v14 setObject:v12 forKeyedSubscript:v13];
        break;
    }
  }
LABEL_43:
  uint64_t v15 = [a1 initWithDomain:@"SYErrorDomain" code:a3 userInfo:v9];

  return v15;
}

@end