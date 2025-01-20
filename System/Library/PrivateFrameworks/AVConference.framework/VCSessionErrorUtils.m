@interface VCSessionErrorUtils
+ (id)VCSessionCaptionsErrorEvent:(unsigned int)a3 errorPath:(id)a4 returnCode:(int64_t)a5;
+ (id)VCSessionErrorEvent:(unsigned int)a3 errorPath:(id)a4 returnCode:(int64_t)a5;
+ (id)VCSessionParticipantErrorEvent:(unsigned int)a3 errorPath:(id)a4;
@end

@implementation VCSessionErrorUtils

+ (id)VCSessionErrorEvent:(unsigned int)a3 errorPath:(id)a4 returnCode:(int64_t)a5
{
  switch(a3)
  {
    case 1u:
      v11 = (void *)MEMORY[0x1E4F28C58];
      v9 = @"Add participant failed";
      v10 = @"Remote participant already exist in session";
      uint64_t v12 = 32016;
      uint64_t v13 = 1;
      goto LABEL_29;
    case 2u:
      v11 = (void *)MEMORY[0x1E4F28C58];
      v9 = @"Add participant failed";
      v10 = @"Remote participant data is nil";
      uint64_t v12 = 32016;
      uint64_t v13 = 2;
      goto LABEL_29;
    case 3u:
      v11 = (void *)MEMORY[0x1E4F28C58];
      v9 = @"Trying to remove an unknown participant";
      v10 = @"Invalid participant";
      uint64_t v12 = 32016;
      uint64_t v13 = 3;
      goto LABEL_29;
    case 4u:
      v11 = (void *)MEMORY[0x1E4F28C58];
      v9 = @"Bad API usage";
      v10 = @"Start called on a stopping session";
      uint64_t v12 = 32028;
      uint64_t v13 = 4;
      goto LABEL_29;
    case 5u:
      v11 = (void *)MEMORY[0x1E4F28C58];
      v9 = @"Bad API usage";
      v10 = @"Stop called on a starting session";
      uint64_t v12 = 32028;
      uint64_t v13 = 5;
      goto LABEL_29;
    case 6u:
      v11 = (void *)MEMORY[0x1E4F28C58];
      v9 = @"Bad API usage";
      v10 = @"Start called while session is already in progress";
      uint64_t v12 = 32028;
      uint64_t v13 = 6;
      goto LABEL_29;
    case 7u:
      v11 = (void *)MEMORY[0x1E4F28C58];
      v9 = @"Bad API usage";
      v10 = @"Stop called on an already stopped session";
      uint64_t v12 = 32028;
      uint64_t v13 = 7;
      goto LABEL_29;
    case 8u:
      v11 = (void *)MEMORY[0x1E4F28C58];
      v9 = @"Session start failed";
      v10 = @"One or more participants failed to start";
      uint64_t v12 = 32000;
      uint64_t v13 = 8;
      goto LABEL_29;
    case 9u:
      v11 = (void *)MEMORY[0x1E4F28C58];
      v9 = @"Add participant failed";
      v10 = @"Remote source collision detected";
      uint64_t v12 = 32024;
      uint64_t v13 = 9;
      goto LABEL_29;
    case 0xAu:
      v11 = (void *)MEMORY[0x1E4F28C58];
      v9 = @"Add participant failed";
      v10 = @"Local source collision detected";
      uint64_t v12 = 32024;
      uint64_t v13 = 10;
      goto LABEL_29;
    case 0xBu:
      v11 = (void *)MEMORY[0x1E4F28C58];
      v9 = @"Update configuration failed";
      v10 = @"Failed to update session configuration";
      uint64_t v12 = 32016;
      uint64_t v13 = 11;
      goto LABEL_29;
    case 0xCu:
      v11 = (void *)MEMORY[0x1E4F28C58];
      v9 = @"Media decryption failed";
      v10 = @"Remote media decryption failed";
      uint64_t v12 = 32018;
      uint64_t v13 = 12;
      goto LABEL_29;
    case 0xDu:
      v11 = (void *)MEMORY[0x1E4F28C58];
      v9 = @"Fractured media detected";
      v10 = @"Remote participant subscribed to unknown stream ID";
      uint64_t v12 = 32027;
      uint64_t v13 = 13;
      goto LABEL_29;
    case 0xEu:
    case 0x18u:
    case 0x19u:
      v7 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v8 = a3;
      v9 = (__CFString *)objc_msgSend(NSString, "stringWithFormat:", @"No remote packets for %ld seconds", a5);
      v10 = @"Remote network outage?";
      v11 = v7;
      uint64_t v12 = 32001;
      uint64_t v13 = v8;
      goto LABEL_29;
    case 0xFu:
      v15 = (void *)MEMORY[0x1E4F28C58];
      v16 = @"Init remote participant failed";
      v17 = @"Unable to init remote participant";
      uint64_t v18 = 32016;
      uint64_t v19 = 15;
      goto LABEL_25;
    case 0x10u:
      v15 = (void *)MEMORY[0x1E4F28C58];
      v16 = @"Add OneToOne Participant failed";
      v17 = @"Unable to add OneToOne participant";
      uint64_t v18 = 32016;
      uint64_t v19 = 16;
      goto LABEL_25;
    case 0x11u:
      v15 = (void *)MEMORY[0x1E4F28C58];
      v16 = @"Configure remote participant failed";
      v17 = @"Unable to configure remote participant";
      uint64_t v18 = 32016;
      uint64_t v19 = 17;
      goto LABEL_25;
    case 0x12u:
      v15 = (void *)MEMORY[0x1E4F28C58];
      v16 = @"Configure OneToOne Local participant failed";
      v17 = @"Unable to configure OneToOne Local participant";
      uint64_t v18 = 32016;
      uint64_t v19 = 18;
      goto LABEL_25;
    case 0x13u:
      v15 = (void *)MEMORY[0x1E4F28C58];
      v16 = @"Session failed to switch from OneToOne to Multiway";
      v17 = @"Unable to send control message";
      uint64_t v18 = 32000;
      uint64_t v19 = 19;
      goto LABEL_25;
    case 0x14u:
      v15 = (void *)MEMORY[0x1E4F28C58];
      v16 = @"Session failed to switch from Multiway to OneToOne";
      v17 = @"Unable to send control message";
      uint64_t v18 = 32000;
      uint64_t v19 = 20;
      goto LABEL_25;
    case 0x15u:
      v15 = (void *)MEMORY[0x1E4F28C58];
      v16 = @"Uplink key material failed to roll";
      v17 = @"No uplink key material update event";
      uint64_t v18 = 32018;
      uint64_t v19 = 21;
      goto LABEL_25;
    case 0x16u:
      v15 = (void *)MEMORY[0x1E4F28C58];
      v16 = @"Call terminated gracefully";
      v17 = @"Remote participant hung up";
      uint64_t v18 = 32003;
      uint64_t v19 = 22;
LABEL_25:
      id result = (id)[v15 AVConferenceServiceError:v18 detailedCode:v19 filePath:a4 description:v16 reason:v17];
      break;
    case 0x17u:
      v11 = (void *)MEMORY[0x1E4F28C58];
      v9 = @"Call failed";
      v10 = @"Media server terminated";
      uint64_t v12 = 32000;
      uint64_t v13 = 23;
LABEL_29:
      id result = (id)[v11 AVConferenceServiceError:v12 detailedCode:v13 returnCode:a5 filePath:a4 description:v9 reason:v10];
      break;
    default:
      id result = 0;
      break;
  }
  return result;
}

+ (id)VCSessionParticipantErrorEvent:(unsigned int)a3 errorPath:(id)a4
{
  switch(a3)
  {
    case 1u:
      v5 = (void *)MEMORY[0x1E4F28C58];
      v6 = @"Failed to set audio position";
      v7 = @"Audio position value is out of range";
      uint64_t v8 = 32016;
      uint64_t v9 = 1;
      goto LABEL_3;
    case 2u:
      v5 = (void *)MEMORY[0x1E4F28C58];
      v6 = @"Participant start error";
      v7 = @"Start called on stopping participant";
      uint64_t v8 = 32028;
      uint64_t v9 = 2;
      goto LABEL_3;
    case 3u:
      v5 = (void *)MEMORY[0x1E4F28C58];
      v6 = @"Participant stop error";
      v7 = @"Stop called on a starting participant";
      uint64_t v8 = 32028;
      uint64_t v9 = 3;
      goto LABEL_3;
    case 4u:
      v5 = (void *)MEMORY[0x1E4F28C58];
      v6 = @"Participant start error";
      v7 = @"Start called on an already started participant";
      uint64_t v8 = 32028;
      uint64_t v9 = 4;
      goto LABEL_3;
    case 5u:
      v5 = (void *)MEMORY[0x1E4F28C58];
      v6 = @"Participant stop error";
      v7 = @"Stop called on an already stopped participant";
      uint64_t v8 = 32028;
      uint64_t v9 = 5;
      goto LABEL_3;
    case 6u:
      v5 = (void *)MEMORY[0x1E4F28C58];
      v6 = @"Participant enabling/disabling audio/video in progress";
      v7 = @"Enable/disable audio or video called when it is already in progress";
      uint64_t v8 = 32028;
      uint64_t v9 = 6;
      goto LABEL_3;
    case 7u:
      v5 = (void *)MEMORY[0x1E4F28C58];
      v6 = @"Participant start in progress";
      v7 = @"Enable/disable audio or video called on a starting participant";
      uint64_t v8 = 32028;
      uint64_t v9 = 7;
      goto LABEL_3;
    case 8u:
      v5 = (void *)MEMORY[0x1E4F28C58];
      v6 = @"Participant stop in progress";
      v7 = @"Enable/disable audio or video called on a stopping participant";
      uint64_t v8 = 32028;
      uint64_t v9 = 8;
      goto LABEL_3;
    case 9u:
      v5 = (void *)MEMORY[0x1E4F28C58];
      v6 = @"Participant in invalid";
      v7 = @"API called when not in the right state";
      uint64_t v8 = 32026;
      uint64_t v9 = 9;
      goto LABEL_3;
    case 0xAu:
      v5 = (void *)MEMORY[0x1E4F28C58];
      v6 = @"Participant start error";
      v7 = @"Memory allocation failed";
      uint64_t v8 = 32000;
      uint64_t v9 = 10;
      goto LABEL_3;
    case 0xBu:
      v5 = (void *)MEMORY[0x1E4F28C58];
      v6 = @"Failed to set the volume";
      v7 = @"Invalid input";
      uint64_t v8 = 32016;
      uint64_t v9 = 11;
      goto LABEL_3;
    case 0xCu:
      v5 = (void *)MEMORY[0x1E4F28C58];
      v6 = @"Participant media state change error";
      v7 = @"Setting the state of this media type is unsupported";
      uint64_t v8 = 32028;
      uint64_t v9 = 12;
      goto LABEL_3;
    case 0xDu:
      v5 = (void *)MEMORY[0x1E4F28C58];
      v6 = @"Participant media state inconsistency";
      v7 = @"Cannot set different states on stream groups that belong to the same media type";
      uint64_t v8 = 32028;
      uint64_t v9 = 13;
      goto LABEL_3;
    case 0xEu:
      v5 = (void *)MEMORY[0x1E4F28C58];
      v6 = @"Participant captions audio IO failure";
      v7 = @"Failed to configure audio IO. Will not start captions.";
      uint64_t v8 = 32000;
      uint64_t v9 = 14;
      goto LABEL_3;
    case 0xFu:
      v5 = (void *)MEMORY[0x1E4F28C58];
      v6 = @"Participant argument error";
      v7 = @"The argument is invalid.";
      uint64_t v8 = 32016;
      uint64_t v9 = 15;
      goto LABEL_3;
    case 0x10u:
      v5 = (void *)MEMORY[0x1E4F28C58];
      v6 = @"Media representation error";
      v7 = @"The provided representation is unsupported.";
      uint64_t v8 = 16;
      uint64_t v9 = 16;
LABEL_3:
      id result = (id)[v5 AVConferenceServiceError:v8 detailedCode:v9 filePath:a4 description:v6 reason:v7];
      break;
    default:
      id result = 0;
      break;
  }
  return result;
}

+ (id)VCSessionCaptionsErrorEvent:(unsigned int)a3 errorPath:(id)a4 returnCode:(int64_t)a5
{
  switch(a3)
  {
    case 1u:
    case 4u:
      v6 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v7 = a3;
      uint64_t v8 = @"Speech Recognizer Error";
      uint64_t v9 = @"The Speech Framework is unavailable";
      goto LABEL_3;
    case 2u:
      v6 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v8 = @"Captions State Transition Failed";
      uint64_t v9 = @"Captions not supported";
      uint64_t v7 = 2;
      goto LABEL_3;
    case 3u:
      v6 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v8 = @"Invalid captions state transition";
      uint64_t v9 = @"Unsupported transition";
      uint64_t v7 = 3;
      goto LABEL_3;
    case 5u:
      v6 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v8 = @"Speech Recognizer Error";
      uint64_t v9 = @"Recognizer is unavailable";
      uint64_t v7 = 5;
      goto LABEL_3;
    case 6u:
      v6 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v8 = @"Speech Analyzer Error";
      uint64_t v9 = @"Analyzer is unavailable";
      uint64_t v7 = 6;
      goto LABEL_3;
    case 7u:
      v6 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v8 = @"Captions Initalization Error";
      uint64_t v9 = @"Recognizer Request/Task or Converter Failed";
      uint64_t v7 = 7;
LABEL_3:
      id result = (id)[v6 AVConferenceServiceError:32016 detailedCode:v7 returnCode:a5 filePath:a4 description:v8 reason:v9];
      break;
    default:
      id result = 0;
      break;
  }
  return result;
}

@end