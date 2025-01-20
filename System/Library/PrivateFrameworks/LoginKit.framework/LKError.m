@interface LKError
+ (id)errorWithCode:(unint64_t)a3;
+ (id)errorWithCode:(unint64_t)a3 userInfo:(id)a4;
@end

@implementation LKError

+ (id)errorWithCode:(unint64_t)a3
{
  return (id)[a1 errorWithCode:a3 userInfo:0];
}

+ (id)errorWithCode:(unint64_t)a3 userInfo:(id)a4
{
  id v5 = a4;
  v6 = v5;
  switch(a3)
  {
    case 1uLL:
      v7 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      v8 = v7;
      v9 = @"Not in Login Window";
      goto LABEL_36;
    case 2uLL:
      v7 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      v8 = v7;
      v9 = @"Not entitled to perform that action";
      goto LABEL_36;
    case 3uLL:
      v7 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      v8 = v7;
      v9 = @"Operation interrupted";
      goto LABEL_36;
    case 4uLL:
      v7 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      v8 = v7;
      v9 = @"Connection interrupted";
      goto LABEL_36;
    case 5uLL:
      v7 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      v8 = v7;
      v9 = @"Connection invalidated";
      goto LABEL_36;
    case 6uLL:
      v7 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      v8 = v7;
      v9 = @"Class not found";
      goto LABEL_36;
    case 7uLL:
      v7 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      v8 = v7;
      v9 = @"User not found";
      goto LABEL_36;
    case 8uLL:
      v7 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      v8 = v7;
      v9 = @"Wrong password";
      goto LABEL_36;
    case 9uLL:
      char v12 = _os_feature_enabled_impl();
      v7 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      v8 = v7;
      if (v12) {
        v9 = @"Not a managed Apple Account";
      }
      else {
        v9 = @"Not a managed Apple ID";
      }
      goto LABEL_36;
    case 0xAuLL:
      v7 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      v8 = v7;
      v9 = @"User‘s Alt DSID is missing";
      goto LABEL_36;
    case 0xBuLL:
      v7 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      v8 = v7;
      v9 = @"User has not authenticated remotely in the last 7 days";
      goto LABEL_36;
    case 0xCuLL:
      v7 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      v8 = v7;
      v9 = @"User‘s short lived token is missing";
      goto LABEL_36;
    case 0xDuLL:
      v7 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      v8 = v7;
      v9 = @"Switching to user failed";
      goto LABEL_36;
    case 0xEuLL:
      v7 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      v8 = v7;
      v9 = @"User‘s account is locked out";
      goto LABEL_36;
    case 0xFuLL:
      v7 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      v8 = v7;
      v9 = @"The maximum number of users allowed on this device has been reached";
      goto LABEL_36;
    case 0x10uLL:
      v7 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      v8 = v7;
      v9 = @"This Apple ID cannot be used on this device";
      goto LABEL_36;
    case 0x11uLL:
      v7 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      v8 = v7;
      v9 = @"Cannot create user";
      goto LABEL_36;
    case 0x12uLL:
      v7 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      v8 = v7;
      v9 = @"Passcode back off";
      goto LABEL_36;
    case 0x13uLL:
      v7 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      v8 = v7;
      v9 = @"No internet connection";
      goto LABEL_36;
    case 0x14uLL:
      v7 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      v8 = v7;
      v9 = @"Cannot fetch authentication mode";
      goto LABEL_36;
    case 0x15uLL:
      v7 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      v8 = v7;
      v9 = @"Federated auth failed";
      goto LABEL_36;
    case 0x16uLL:
      v7 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      v8 = v7;
      v9 = @"Unknown authentication mode received";
      goto LABEL_36;
    case 0x17uLL:
      v7 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      v8 = v7;
      v9 = @"Server connection failed. Please try again.";
      goto LABEL_36;
    case 0x18uLL:
      v7 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      v8 = v7;
      v9 = @"Please try again";
      goto LABEL_36;
    case 0x19uLL:
      v7 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      v8 = v7;
      v9 = @"Login timed out";
      goto LABEL_36;
    case 0x1AuLL:
      v7 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      v8 = v7;
      v9 = @"Login was not ready for the given period of time";
      goto LABEL_36;
    case 0x1BuLL:
      v7 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      v8 = v7;
      v9 = @"Unable to register for a notification";
      goto LABEL_36;
    case 0x1CuLL:
      v7 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      v8 = v7;
      v9 = @"Device is not in multi user mode";
      goto LABEL_36;
    case 0x1DuLL:
      v7 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      v8 = v7;
      v9 = @"Device is not in homescreen";
      goto LABEL_36;
    case 0x1EuLL:
      v7 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      v8 = v7;
      v9 = @"Network request timed out";
      goto LABEL_36;
    case 0x1FuLL:
      v7 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      v8 = v7;
      v9 = @"Another login is ongoing";
LABEL_36:
      v10 = [v7 localizedStringForKey:v9 value:&stru_26D490708 table:0];

      if (v6) {
        goto LABEL_37;
      }
      goto LABEL_4;
    default:
      v10 = @"An error occurred";
      if (v5) {
LABEL_37:
      }
        v11 = (void *)[v6 mutableCopy];
      else {
LABEL_4:
      }
        v11 = objc_opt_new();
      v13 = v11;
      [v11 setObject:v10 forKeyedSubscript:*MEMORY[0x263F08320]];
      v14 = [MEMORY[0x263F087E8] errorWithDomain:@"LKLoginDomainErrorDomain" code:a3 userInfo:v13];

      return v14;
  }
}

@end